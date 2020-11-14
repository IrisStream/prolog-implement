/*--------------------------FACTS--------------------------*/

male('tu').
male('son').
male('bao').
male('an').
male('binh').

female('my').
female('hien').
female('ha').

faculty_of('cntt', 'khtn').
faculty_of('cnsh', 'khtn').

graduated('my').

student('tu', 'khmt').
student('son', 'khmt').
student('bao', 'khdl').

student_of('my', 'cnsh').
student_of('tu', 'cntt').
student_of('son', 'cntt').
student_of('bao', 'cntt').

gpa('tu', 7).
gpa('son', 7.5).
gpa('bao', 7.5).
gpa('my', 9.9).

current_semester_gpa('tu', 6.5).
current_semester_gpa('son', 7.3).
current_semester_gpa('bao', 8.5).
current_semester_gpa('my', 9.5).

training_point('tu', 80).
training_point('son', 99).
training_point('bao', 50).
training_point('my', 85).

day_number_of_volunteer('tu', 5).
day_number_of_volunteer('son', 7).
day_number_of_volunteer('bao', 3).
day_number_of_volunteer('my', 5).

english_degree('tu', 'ielts').
english_degree('my', 'toeic').
english_degree('son', 'ielts').
english_degree('bao', 'vnu').

health_degree('tu').
health_degree('son').
health_degree('my').

studied('tu', '18_21', 'ai', {null}).
studied('tu', '18_22', 'ktdl', {null}).
studied('son', '18_3', 'hdh', {null}).
studied('bao', '18_4', 'tth', {null}).
studied('bao', '18_22', 'ktdl', {null}).
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

/*--------------------------RULES--------------------------*/

still_studying(Student):-
    not(graduated(Student)).

subject_passed(Student, Subject):-
    studied(Student, Class, Subject, Point),
    Point\=={null},
    Point>=5.

teach(Prof,Student,Subject):-
    teach_of(Prof,Class,Subject),
    studied(Student,Class,Subject,Point).

is_studied(Student,Prof,Subject):-
    studied(Student,Class,Subject,Point),
    teach_of(Prof,Class,Subject).

classmate(Student1,Student2):-
    studied(Student1,Class,Subject,Point1),
    studied(Student2,Class,Subject,Point2).

same_major(Student1,Student2):-
    student(Student1,Major),
    student(Student2,Major),
    Student1\==Student2.

gpa_greater(Student1,Student2):-
    gpa(Student1,Point1),
    gpa(Student2,Point2),
    Point1>Point2.

best_of_class(Student,Class,Subject):-
    studied(Student,Class,Subject,Point), \+ (studied(_,Class,Subject,Point1), Point1\=={null}, Point1 > Point).

best_of_faculty(Student):-
    student_of(Student,Faculty),
    gpa(Student,Point), \+ (
        student_of(AnotherStudent,Faculty),
        gpa(AnotherStudent,Point1),
        Point1 > Point).

best_of_major(Student,Major):-
    student(Student,Major),
    gpa(Student,Point), \+ (
        student(AnotherStudent,Major),
        gpa(AnotherStudent,Point1),
        Point1 > Point).

