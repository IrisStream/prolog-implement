/*FACTS*/
faculty_of('FIT', 'HCMUS').
faculty_of('BBT', 'HCMUS').
faculty_of('PHYS', 'HCMUS').
faculty_of('MATH', 'HCMUS').
faculty_of('CHEM', 'HCMUS').

department_of('KHMT', 'FIT').
department_of('CNPM', 'FIT').
department_of('MMT', 'FIT').
department_of('CNTT', 'FIT').
department_of('TGMT', 'FIT').
department_of('HTTT', 'FIT').

subject_of('NMLT', 'CNPM').
subject_of('KTLT', 'CNPM').
subject_of('NMCNTT 1', 'KHMT').
subject_of('NMCNTT 2', 'KHMT').
subject_of('CTDL&GT', 'KHMT').
subject_of('OOP', 'CNPM').
subject_of('KTMT&HN', 'MMT').
subject_of('CSDL', 'HTTT').
subject_of('MMT', 'MMT').
subject_of('HDH', 'MMT').
subject_of('CSTTNT', 'KHMT').
subject_of('KTDL&UD', 'KHMT').
subject_of('NMMM', 'CNTT').
subject_of('NMKHDL', 'KHMT').
subject_of('DHMT', 'TGMT').
subject_of('XLAS&VS', 'TGMT').
subject_of('JAVA', 'CNPM').


major_of('KHMT', 'FIT').
major_of('CNTT', 'FIT').
major_of('TGMT', 'FIT').
major_of('CNTT', 'FIT').
major_of('KHDL', 'FIT').
major_of('CNPM', 'FIT').
major_of('HTTT', 'FIT').
major_of('Cong nghe thong tin', 'FIT').
major_of('MMT', 'FIT').
major_of('GT', 'MATH').
major_of('HHC', 'CHEM').
major_of('VLHN', 'PHYS').
major_of('SH', 'FBB').

specialization_of('CNTT', 'KHMT').
specialization_of('TGMT', 'KHMT').
specialization_of('CNTT', 'KHMT').
specialization_of('KHDL', 'KHMT').
specialization_of('MMT', 'Cong nghe thong tin').

/*----------------------------------------> FACT FOR TESTING <----------------------------------------*/
/*
student('bao long', 'major A').
gpa('bao long', 8).
gpa('Bao', 9).
trCSTTNTning_point('bao long', 80).
health_degree('bao long').
day_number_of_volunteer('bao long', 50).
english_degree('bao long', 'IELTS").

% subject in department
subject_of('subject A', 'department A').

% department in faculty
department_of('department A', 'faculty A').

% teacher in department
teacher('A teacher', 'department A').
teacher('Another teacher', 'department A').

superior('A teacher', 'Another teacher').

faculty_of('faculty A', 'school A').

major_of('major A', 'faculty A').

student_of('bao long', 'faculty A').
student_of('Bao', 'faculty A').
*/
/*----------------------------------------> RULE <----------------------------------------*/
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
male('Tran Tuan Son').
male('Le Viet Long').

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
teacher('Tran Tuan Son', 'MMT').
teacher('Le Viet Long', 'MMT').

teach('Le Ngoc Thanh', '18_2', 'NMLT').
teach('Le Hoai Bac', '18_21', 'CSTTNT').
teach('Le Hoai Bac', '18_22', 'KTDL&UD').
teach('Nguyen Thi Ngoc Thao', '18_22', 'CTDL&GT').
teach('Nguyen Thi Phuong Uyen', '18_4', 'OOP').
teach('Ho Tan Thanh', '18_3', 'JAVA').
teach('Nguyen Thi Minh Tuyen', '18_2', 'NMCNPM').
teach('Nguyen Van Khiet', '18_2', 'OOP').
teach('Nguyen Ngoc Vu', '18_1', 'OOP').
teach('Tran Tuan Son', 18_4, 'MMT').

superior('Le Ngoc Thanh', 'Le Hoai Bac').
superior('Le Hoai Bac', 'Nguyen Thi Ngoc Thao').
superior('Le Hoai Bac', 'Nguyen Thi Phuong Uyen').
superior('Nguyen Thi Minh Tuyen', 'Ho Tan Thanh').
superior('Ho Tan Thanh', 'Nguyen Van Khiet').
superior('Ho Tan Thanh', 'Nguyen Ngoc Vu').
superior('Tran Tuan Son', 'Le Viet Long').

/*----------------------------------------> END FACT FOR TEACHER (BB) <----------------------------------------*/

/*--------------------------FACTS OF STUDENT (TU)--------------------------*/

male('Tu').
male('Son').
male('Bao').
male('An').
male('Binh').

female('My').
female('Hien').
female('Ha').
female('Tuong').


graduated('My').
graduated('An').
graduated('Tuong').

student_of_major('Tu', 'KHMT').
student_of_major('Son', 'KHMT').
student_of_major('Bao', 'KHDL').
student_of_major('An','VLHN').
student_of_major('Ha', 'HTTT').
student_of_major('Tuong', 'CNPM').
student_of_major('Binh', 'GT').     % Chuyen nganh giai tich
student_of_major('Hien', 'HHC').    % Chuyen nganh hoa huu co
student_of_major('My', 'SH').      % Chuyen nganh vi sinh

student_of_faculty('Tu', 'FIT').
student_of_faculty('Son', 'FIT').
student_of_faculty('Bao', 'FIT').
student_of_faculty('An', 'PHYS').
student_of_faculty('Binh', 'MATH').
student_of_faculty('My', 'FBB').
student_of_faculty('Hien', 'CHEM').
student_of_faculty('Ha', 'FIT').
student_of_faculty('Tuong', 'FIT').

gpa('Tu', 7).
gpa('Son', 8.0).
gpa('Bao', 7.5).
gpa('An', 6).
gpa('Binh', 5.75).
gpa('My', 9.9).
gpa('Hien', 7.3).
gpa('Ha', 6.5).
gpa('Tuong', 8).

current_semester_gpa('Tu', 6.5).
current_semester_gpa('Son', 7.3).
current_semester_gpa('Bao', 8.5).
current_semester_gpa('Binh', 7).
current_semester_gpa('Hien', 9.2).
current_semester_gpa('Ha', 5.5).


training_point('Tu', 80).
training_point('Son', 99).
training_point('Bao', 50).
training_point('An', 85).
training_point('Binh', 72).
training_point('My', 90).
training_point('Hien', 68).
training_point('Ha', 88).
training_point('Tuong', 95).

day_number_of_volunteer('Tu', 5).
day_number_of_volunteer('Son', 7).
day_number_of_volunteer('Bao', 3).
day_number_of_volunteer('An', 10).
day_number_of_volunteer('Binh', 6).
day_number_of_volunteer('My', 6).
day_number_of_volunteer('Hien', 3).
day_number_of_volunteer('Ha', 4).
day_number_of_volunteer('Tuong', 4).

english_degree('Tu', 'IELTS').
english_degree('Son', 'IELTS').
english_degree('Bao', 'VNU').
english_degree('An', 'VNU').
english_degree('My', 'TOEIC').
english_degree('Tuong', 'VNU').

health_degree('Tu').
health_degree('Son').
health_degree('My').

studied('Tu', '18_21', 'CSTTNT', 4).
studied('Tu', '18_22', 'KTDL&UD', 5).
studied('Son', '18_4', 'HDH', 6).
studied('Bao', '18_22', 'KTDL&UD', 7).
studied('Bao', '18_22', 'CSTTNT', 1).
studied('Bao', '18_22', 'KTLT', 5.5).
studied('Tu', '18_22', 'KTLT', 6.5).
studied('Son', '18_22', 'KTLT', 7.5).
studied('Bao', '18_4', 'OOP', 5.5).
studied('Bao', '18_3', 'JAVA', 5.5).
studied('Tu', '18_4', 'OOP', 6.5).
studied('Son', '18_4', 'OOP', 7.5).
studied('Bao', '18_2', 'NMLT', 5.5).
studied('Tu', '18_2', 'NMLT', 6.5).
studied('Son', '18_2', 'NMLT', 7.5).
studied('Bao', '18_2', 'NMCNPM', 5.5).


/*----------------------------------------> END RULE OF STUDENT <----------------------------------------*/


/*----------------------------------------> RULE OF BB <----------------------------------------*/

schoolarship(Student):-
    gpa(Student, GPA),
    GPA >= 8,
    training_point(Student, Training_point),
    Training_point >= 80.

student_of_5_mertics(Student):-
    health_degree(Student),
    english_degree(Student, AnyKindOfDegree),
    gpa(Student, GPA), 
    GPA >= 8,
    training_point(Student, Training_point), 
    Training_point >= 80,
    day_number_of_volunteer(Student, Days), 
    Days >= 5.

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
    student_of_major(Student, Major),
    major_of(Major, Faculty),
    faculty_of(Faculty, School).

% phó bộ môn là người được trưởng bộ môn quản lý 
% người này cũng quản lý tất cả các giảng viên khác trong bộ môn nhưng trong luật không nêu ra
deputy_head_of_department(Prof):-
    teacher(Prof, AnyDepartment),
    head_of_department(AnotherProf),
    superior(AnotherProf, Prof).

% trưởng bộ môn là người không có ai quản lý
head_of_department(Prof):-
    teacher(Prof, AnyDepartment),
    \+ superior(AnyOtherProf, Prof).

graduated_type(Student, 'Gioi'):-
    graduated(Student),
    gpa(Student, GPA),
    GPA >= 8.

graduated_type(Student, 'Kha'):-
    graduated(Student),
    gpa(Student, GPA),
    GPA < 8,
    GPA >= 6.5.

graduated_type(Student, 'TB'):-
    graduated(Student),
    gpa(Student, GPA),
    GPA < 6.5,
    GPA >= 5.

graduated_type(Student, 'Yeu'):-
    graduated(Student),
    gpa(Student, GPA),
    GPA < 5. 
 
graduate_valedictorian(Student, Faculty):-
    graduated(Student),
    student_of_faculty(Student,Faculty),
    gpa(Student, Point), \+ (
        student_of_faculty(Student1,Faculty),
        graduated(Student1),
        gpa(Student1, Point1),
        Point1 > Point
    ).

best_of_faculty(Student, Faculty):-
    student_of_faculty(Student,Faculty),
    \+ graduated(Student),
    gpa(Student,Point), \+ (
        student_of_faculty(S,Faculty),
        \+ graduated(S),
        gpa(S,Point1),
        Point1 > Point
    ).

/*----------------------------------------> END RULE OF BB <----------------------------------------*/

/*Rules of Son*/
same_department(Prof1, Prof2):-
    teacher(Prof1, Dep),
    teacher(Prof2, Dep),
    Prof1 \= Prof2.

of_faculty(Person, Faculty):-
    student_of_faculty(Person, Faculty);
    (teacher(Person, Dep),
    department_of(Dep, Faculty)).

same_faculty(Person1, Person2):-
    of_faculty(Person1, Faculty),
    of_faculty(Person2, Faculty),
    Person1 \= Person2.

of_school(Person, School):-
    student_of_school(Person, School);
    prof_of_school(Person, School).

same_school(Person1, Person2):-
    of_school(Person1, School),
    of_school(Person2, School),
    Person1 \= Person2.

male_student(Student):-
    male(Student),
    student_of_faculty(Student, _).

female_student(Student):-
    female(Student),
    student_of_faculty(Student, _).

male_teacher(Teacher):-
    male(Teacher),
    teacher(Teacher, _).

female_teacher(Teacher):-
    female(Teacher),
    teacher(Teacher, _).

student_type(Student, 'Gioi'):-
    gpa(Student, GPA),
    GPA >= 8.

student_type(Student, 'Kha'):-
    gpa(Student, GPA),
    GPA < 8,
    GPA >= 6.5.

student_type(Student, 'TB'):-
    gpa(Student, GPA),
    GPA < 6.5,
    GPA >= 5.

student_type(Student, 'Yeu'):-
    gpa(Student, GPA),
    GPA < 5. 
 
academic_warning(Student):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Point < 1.4.

forced_out_of_school(Student):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Point =:= 0.
/*-------------------------------------*/
/*-------------Rule of Tu-------------*/
still_studying(Student):-
    student_of_faculty(Student,Faculty),
    \+(graduated(Student)).

subject_passed(Student, Subject):-
    studied(Student, Class, Subject, Point),
    Point\=={null},
    Point>=5.

teach_of(Prof,Student,Subject):-
    teach(Prof,Class,Subject),
    studied(Student,Class,Subject,Point).

is_studied(Student,Prof,Subject):-
    studied(Student,Class,Subject,Point),
    teach(Prof,Class,Subject).

classmate(Student1,Student2):-
    studied(Student1,Class,Subject,Point1),
    studied(Student2,Class,Subject,Point2),
    Student1 \= Student2.

same_major(Student1,Student2):-
    student_of_major(Student1,Major),
    student_of_major(Student2,Major),
    Student1\==Student2.

gpa_greater(Student1,Student2):-
    gpa(Student1,Point1),
    gpa(Student2,Point2),
    Point1>Point2.

best_of_class(Student,Class,Subject):-
    studied(Student,Class,Subject,Point), \+ (studied(_,Class,Subject,Point1), Point1\=={null}, Point1 > Point).


best_of_major(Student,Major):-
    student_of_major(Student,Major),
    gpa(Student,Point), \+ (
        student_of_major(AnotherStudent,Major),
        gpa(AnotherStudent,Point1),
        Point1 > Point).
