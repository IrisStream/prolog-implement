/*----------------------------------------> FACT FOR TEACHER (BB) <----------------------------------------*/

/*  Description
    * có 2 bộ môn: CNPM và KHMT
    * 2 trưởng bộ môn: Lê ngọc thành, nguyễn thị minh tuyền
    * 2 phó bộ môn: lê hoài bắc, hồ tấn thanh 
*/

male('Le Ngoc Thanh').
male('Le Hoai Bac').
male('Nguyen Van Khiet').
male('Ho Tan Thanh').
male('Nguyen Ngoc Vu').

female('Nguyen Thi Ngoc Thao').
female('Nguyen Thi Minh Tuyen').
female('Nguyen Thi Phuong Uyen').

teacher('Le Ngoc Thanh', 'KHMT').
teacher('Le Hoai Bac', 'KHMT').
teacher('Nguyen Thi Ngoc Thao', 'KHMT').
teacher('Nguyen Thi Phuong Uyen', 'KHMT').
teacher('Ho Tan Thanh', 'CNPM').
teacher('Nguyen Van Khiet', 'CNPM').
teacher('Nguyen Thi Minh Tuyen', 'CNPM').
teacher('Nguyen Ngoc Vu', 'CNPM').

teach('Le Ngoc Thanh', '18CTT2', 'NMLT').
teach('Le Hoai Bac', '18CTT2', 'CSAI').
teach('Nguyen Thi Ngoc Thao', '18CTT3', 'CTDL&GT').
teach('Nguyen Thi Phuong Uyen', '18CTT4', 'OOP').
teach('Ho Tan Thanh', '18CTT3', 'Java').
teach('Nguyen Thi Minh Tuyen', '18CTT2', 'NM CNPM').
teach('Nguyen Van Khiet', '18CTT2', 'OOP').
teach('Nguyen Ngoc Vu', '18CTT1', 'OOP').

superior('Le Ngoc Thanh', 'Le Hoai Bac').
superior('Le Hoai Bac', 'Nguyen Thi Ngoc Thao').
superior('Le Hoai Bac', 'Nguyen Thi Phuong Uyen').
superior('Nguyen Thi Minh Tuyen', 'Ho Tan Thanh').
superior('Ho Tan Thanh', 'Nguyen Van Khiet').
superior('Ho Tan Thanh', 'Nguyen Ngoc Vu').

/*----------------------------------------> END FACT FOR TEACHER (BB) <----------------------------------------*/

/*----------------------------------------> RULE OF BB <----------------------------------------*/

schoolarship(Student):-
    gpa(Student, GPA),
    GPA >= 8,
    training_point(Student, Training_point),
    Training_point >= 80.

student_of_5_mertics(Student):-
    health_degree(Student),
    english_degree(Student, AnyKindOfDegree),
    gpa(Student, GPA), GPA >= 8,
    training_point(Student, Training_point), Training_point >= 80,
    day_number_of_volunteer(Student, Days), Days >= 10.

% subject in faculty
subject_of_faculty(Subject, Faculty):-
    subject_of(Subject, Department),
    department_of(Department, Faculty).

% teacher in faculty
prof_of_faculty(Prof, Faculty):-
    teacher(Prof, Department),
    department_of(Department, Faculty).

% teacher of school
prof_of_school(Prof, School):-
    teacher(Prof, Department),
    department_of(Department, Faculty),
    faculty_of(Faculty, School).

student_of_school(Student, School):-
    student(Student, Major),
    major_of(Major, Faculty),
    faculty_of(Faculty, School).

% phó bộ môn là người được trưởng bộ môn quản lý 
% nó cũng quản lý tất cả các thằng khác trong bộ môn nhưng trong luật không nêu ra
deputy_head_of_department(Prof):-
    teacher(Prof, AnyDepartment),
    head_of_department(AnotherProf),
    superior(AnotherProf, Prof).

% trưởng bộ môn là người không có ai quản lý
head_of_department(Prof):-
    teacher(Prof, AnyDepartment),
    \+ superior(AnyOtherProf, Prof).

graduated_type(Student, 'Gioi'):-
    gpa(Student, GPA),
    GPA >= 8.

graduated_type(Student, 'Kha'):-
    gpa(Student, GPA),
    GPA < 8,
    GPA >= 6.5.

graduated_type(Student, 'TB'):-
    gpa(Student, GPA),
    GPA < 6.5,
    GPA >= 5.

graduated_type(Student, 'Yeu'):-
    gpa(Student, GPA),
    GPA < 5.

graduate_valedictorian(Student):-
    gpa(Id, W), \+ (gpa(_, W1), W1 > W).


best_of_faculty(Student):-
    student_of(Student,Faculty1),
    gpa(Student,Point), \+ (
        student_of(S,Faculty1),
        gpa(S,Point1),
        Point1 > Point
    ).

/*----------------------------------------> END RULE OF BB <----------------------------------------*/