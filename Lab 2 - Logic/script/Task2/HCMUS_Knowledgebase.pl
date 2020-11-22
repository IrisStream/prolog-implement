/*FACTS*/
faculty_of('FIT', 'HCMUS').

department_of('KHTM', 'FIT').
department_of('CNPM', 'FIT').
department_of('MMT', 'FIT').
department_of('CNTT', 'FIT').
department_of('TGMT', 'FIT').
department_of('HTTT', 'FIT').

subject_of('Nhap mon lap trinh', 'CNPM').
subject_of('Ki thuat lap trinh', 'CNPM').
subject_of('Nhap mon cong nghe thong tin 1', 'KHTM').
subject_of('Nhap mon cong nghe thong tin 2', 'KHTM').
subject_of('Cau truc du lieu & giai thuat', 'KHTM').
subject_of('Phuong phap lap trinh huong doi tuong', 'CNPM').
subject_of('Kien truc may tinh va hop ngu', 'MMT').
subject_of('Co so du lieu', 'HTTT').
subject_of('Mang may tinh', 'MMT').
subject_of('He dieu hanh', 'MMT').
subject_of('Co so tri tue nhan tao', 'KHTM').
subject_of('Khai thac du lieu & ung dung', 'KHTM').
subject_of('Nhap mon mat ma', 'CNTT').
subject_of('Nhap mon khoa hoc du lieu', 'KHTM').
subject_of('Do hoa may tinh', 'TGMT').
subject_of('Xu ly anh so & video so', 'TGMT').

major_of('KHTM', 'FIT').
major_of('CNTT', 'FIT').
major_of('TGMT', 'FIT').
major_of('CNTT', 'FIT').
major_of('KHDL', 'FIT').
major_of('CNPM', 'FIT').
major_of('HTTT', 'FIT').
major_of('Cong nghe thong tin', 'FIT').
major_of('MMT', 'FIT').

specialization_of('CNTT', 'KHTM').
specialization_of('TGMT', 'KHTM').
specialization_of('CNTT', 'KHTM').
specialization_of('KHDL', 'KHTM').
specialization_of('MMT', 'Cong nghe thong tin').

/*----------------------------------------> FACT FOR TESTING <----------------------------------------*/
/*
student('bao long', 'major A').
gpa('bao long', 8).
gpa('bao', 9).
training_point('bao long', 80).
health_degree('bao long').
day_number_of_volunteer('bao long', 50).
english_degree('bao long', 'ielts').

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
student_of('bao', 'faculty A').
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

/*--------------------------FACTS OF STUDENT (TU)--------------------------*/

male('tu').
male('son').
male('bao').
male('an').
male('binh').

female('my').
female('hien').
female('ha').
female('tuong').

faculty_of('FIT', 'HCMUS').
faculty_of('BBT', 'HCMUS').

graduated('my').
graduated('an').
graduated('tuong').

student_of_major('tu', 'KHMT').
student_of_major('son', 'KHMT').
student_of_major('bao', 'KHDL').
student_of_major('an','VLHN').
student_of_major('ha', 'HTTT').
student_of_major('tuong', 'CNPM').

student_of_faculty('tu', 'FIT').
student_of_faculty('son', 'FIT').
student_of_faculty('bao', 'FIT').
student_of_faculty('an', 'VL').
student_of_faculty('binh', 'TOAN').
student_of_faculty('my', 'BBT').
student_of_faculty('hien', 'HOA').
student_of_faculty('ha', 'FIT').
student_of_faculty('tuong', 'FIT').

gpa('tu', 7).
gpa('son', 4.0).
gpa('bao', 7.5).
gpa('an', 6).
gpa('binh', 5.75).
gpa('my', 9.9).
gpa('hien', 7.3).
gpa('ha', 6.5).
gpa('tuong', 8).

current_semester_gpa('tu', 6.5).
current_semester_gpa('son', 7.3).
current_semester_gpa('bao', 8.5).
current_semester_gpa('binh', 7).
current_semester_gpa('hien', 9.2).
current_semester_gpa('ha', 5.5).


training_point('tu', 80).
training_point('son', 99).
training_point('bao', 50).
training_point('an', 85).
training_point('binh', 72).
training_point('my', 90).
training_point('hien', 68).
training_point('ha', 88).
training_point('tuong', 95).

day_number_of_volunteer('tu', 5).
day_number_of_volunteer('son', 7).
day_number_of_volunteer('bao', 3).
day_number_of_volunteer('an', 10).
day_number_of_volunteer('binh', 6).
day_number_of_volunteer('my', 2).
day_number_of_volunteer('hien', 3).
day_number_of_volunteer('ha', 4).
day_number_of_volunteer('tuong', 4).

english_degree('tu', 'ielts').
english_degree('son', 'ielts').
english_degree('bao', 'vnu').
english_degree('an', 'vnu').
english_degree('my', 'toeic').
english_degree('tuong', 'vnu').

health_degree('tu').
health_degree('son').
health_degree('my').

studied('tu', '18_21', 'ai', null).
studied('tu', '18_22', 'ktdl', null).
studied('son', '18_3', 'hdh', null).
studied('bao', '18_4', 'tth', null).
studied('bao', '18_22', 'ktdl', null).
studied('bao', '18_22', 'ai', 1).
studied('bao', '18_22', 'ktlt', 5.5).
studied('tu', '18_22', 'ktlt', 6.5).
studied('son', '18_22', 'ktlt', 7.5).

teacher('an', 'dp1').
teacher('hien', 'dp1').
teacher('binh', 'dp2').
teacher('ha', 'dp2').

teach_of('an', '18_3', 'hdh').
teach_of('hien', '18_21', 'ai').
teach_of('binh', '18_22', 'ktdl').
teach_of('ha', '18_4', 'tth').

subject_of('ai', 'dp1').
subject_of('ktdl', 'dp1').
subject_of('tth', 'dp2').
subject_of('hdh', 'dp1').

major_of('khmt', 'cntt').
major_of('khdl', 'cntt').

department_of('dp1', 'cntt').
department_of('dp2', 'cntt').

superior('an', 'hien').
superior('an', 'ha').
superior('binh', 'ha').
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
    student_of_major(Student, Major),
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
    student_of_faculty(Student,Faculty),
    gpa(Student,Point), \+ (
        student_of_faculty(S,Faculty1),
        gpa(S,Point1),
        Point1 > Point
    ).

/*----------------------------------------> END RULE OF BB <----------------------------------------*/

/*Rules of Son*/
same_department(Prof1, Prof2):-
    teacher(Prof1, Dep),
    teacher(Prof2, Deq),
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

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == "Xuat sac",
    Point == 4.

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == 'Gioi',
    Point < 4,
    Point >= 3.75.


student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == 'Kha Gioi',
    Point < 3.75,
    Point >= 3.5.

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == 'Kha',
    Point < 3.5,
    Point >= 3.0.

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == 'Trung binh kha',
    Point < 3,
    Point >= 2.5.

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == 'Trung binh',
    Point < 2.5,
    Point >= 2.

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == 'Yeu',
    Point < 2,
    Point >= 1.3.

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == 'Kem',
    Point < 1.3,
    Point >= 1.

student_type(Student, Type):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Type == "Rat kem",
    Point < 1,
    Point >= 0.


academic_warning(Student):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Point < 1.4.

forced_out_of_school(Student):-
    student_of_faculty(Student, _),
    gpa(Student, Point),
    Point =:= 0.
/*-------------------------------------*/