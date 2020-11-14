/*----------------------------------------> FACT FOR TESTING <----------------------------------------*/

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