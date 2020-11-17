/*--------------------------FACTS--------------------------*/

male('tu').
male('son').
male('bao').
male('an').
male('binh').

female('my').
female('hien').
female('ha').
female('tuong').

faculty_of('cntt', 'khtn').
faculty_of('cnsh', 'khtn').

graduated('my').
graduated('an').
graduated('tuong').

major_of_student('tu', 'khmt').
major_of_student('son', 'khmt').
major_of_student('bao', 'khdl').
major_of_student('an','vlhn').
major_of_student('ha', 'httt').
major_of_student('tuong', 'nmpm').

faculty_of_student('tu', 'cntt').
faculty_of_student('son', 'cntt').
faculty_of_student('bao', 'cntt').
faculty_of_student('an', 'vl').
faculty_of_student('binh', 'toan').
faculty_of_student('my', 'cnsh').
faculty_of_student('hien', 'hoa').
faculty_of_student('ha', 'cntt').
faculty_of_student('tuong', 'cntt').

gpa('tu', 7).
gpa('son', 8.5).
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
    major_of_student(Student1,Major),
    major_of_student(Student2,Major),
    Student1\==Student2.

gpa_greater(Student1,Student2):-
    gpa(Student1,Point1),
    gpa(Student2,Point2),
    Point1>Point2.

best_of_class(Student,Class,Subject):-
    studied(Student,Class,Subject,Point), \+ (studied(_,Class,Subject,Point1), Point1\=={null}, Point1 > Point).

best_of_faculty(Student):-
    faculty_of_student(Student,Faculty),
    gpa(Student,Point), \+ (
        faculty_of_student(AnotherStudent,Faculty),
        gpa(AnotherStudent,Point1),
        Point1 > Point).

best_of_major(Student,Major):-
    major_of_student(Student,Major),
    gpa(Student,Point), \+ (
        major_of_student(AnotherStudent,Major),
        gpa(AnotherStudent,Point1),
        Point1 > Point).

