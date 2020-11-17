/*FACTS*/
faculty_of('FIT', 'HCMUS').

department_of('Khoa hoc may tinh', 'FIT').
department_of('Cong nghe phan mem', 'FIT').
department_of('Mang May Tinh', 'FIT').
department_of('Cong nghe tri thuc', 'FIT').
department_of('Thi giac may tinh', 'FIT').
department_of('He thong thong tin', 'FIT').

subject_of('Nhap mon lap trinh', 'Cong nghe phan mem').
subject_of('Ki thuat lap trinh', 'Cong nghe phan mem').
subject_of('Nhap mon cong nghe thong tin 1', 'Khoa hoc may tinh').
subject_of('Nhap mon cong nghe thong tin 2', 'Khoa hoc may tinh').
subject_of('Cau truc du lieu & giai thuat', 'Khoa hoc may tinh').
subject_of('Phuong phap lap trinh huong doi tuong', 'Cong nghe phan mem').
subject_of('Kien truc may tinh va hop ngu', 'Mang may tinh').
subject_of('Co so du lieu', 'He thong thong tin').
subject_of('Mang may tinh', 'Mang may tinh').
subject_of('He dieu hanh', 'Mang may tinh').
subject_of('Co so tri tue nhan tao', 'Khoa hoc may tinh').
subject_of('Khai thac du lieu & ung dung', 'Khoa hoc may tinh').
subject_of('Nhap mon mat ma', 'Cong nghe tri thuc').
subject_of('Nhap mon khoa hoc du lieu', 'Khoa hoc may tinh').
subject_of('Do hoa may tinh', 'Thi giac may tinh').
subject_of('Xu ly anh so & video so', 'Thi giac may tinh').

major_of('Khoa hoc may tinh', 'FIT').
major_of('Cong nghe tri thuc', 'FIT').
major_of('Thi giac may tinh', 'FIT').
major_of('Cong nghe tri thuc', 'FIT').
major_of('Khoa hoc du lieu', 'FIT').
major_of('Cong nghe phan mem', 'FIT').
major_of('He thong thong tin', 'FIT').
major_of('Cong nghe thong tin', 'FIT').
major_of('Mang may tinh', 'FIT').

specialization_of('Cong nghe tri thuc', 'Khoa hoc may tinh').
specialization_of('Thi giac may tinh', 'Khoa hoc may tinh').
specialization_of('Cong nghe tri thuc', 'Khoa hoc may tinh').
specialization_of('Khoa hoc du lieu', 'Khoa hoc may tinh').
specialization_of('Mang may tinh', 'Cong nghe thong tin').

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

% deputy_head_of_department(Prof):-


head_of_department(Prof):-
    teacher(Prof, AnyDepartment),
    superior(Prof, AnyOtherProf).

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

/*Rules of Son*/
same_department(Prof1, Prof2):-
    teacher(Prof1, Dep),
    teacher(Prof2, Deq),
    Prof1 \= Prof2.

of_faculty(Person, Faculty):-
    student_of(Person, Faculty);
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
    student(Student, _).

female_student(Student):-
    female(Student),
    student(Student, _).

male_teacher(Teacher):-
    male(Teacher),
    teacher(Teacher, _).

female_teacher(Teacher):-
    female(Teacher),
    teacher(Teacher, _).

student_type(Student, Type):-
    student(Student, _),
    gpa(Student, Point),
    ((Point >= 4.0,
    Type =:= 'Xuat sac');
    (Point >= 3.75, 
    Type =:= 'Gioi');
    (Point >= 3.5, 
    Type =:= 'Kha gioi');
    (Point >= 3.0,
    Type =:= 'Kha');
    (Point >= 2.5,
    Type =:= 'Trung binh kha');
    (Point >= 2.0,
    Type =:= 'Trung binh');
    (Point >= 1.3,
    Type =:= 'Yeu');
    (Point >= 1.0,
    Type =:= 'Kem');
    (Point >= 0,
    Type =:= 'Rat kem')).

academic_warning(Student):-
    student(Student, _),
    gpa(Student, Point),
    Point < 1.4.

forced_out_of_school(Student):-
    student(Student, _),
    gpa(Student, Point),
    Point =:= 0.