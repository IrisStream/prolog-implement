/*--------------------------FACTS------------------------------*/

/* male(Person) : Person is a man */
male('Philip').
male('Charles').
male('Mark Philips').
male('Timothy Laurence').
male('Andrew').
male('Edward').
male('William').
male('Harry').
male('Peter Phillips').
male('Mike Tindall').
male('James Viscount Severn').
male('George').

/* female(Person): Person is a woman */
female('Elizabeth II').
female('Diana').
female('Camilla Parker Bowles').
female('Anne').
female('Sarah Ferguson').
female('Sophie Rhys-jones').
female('Kate Middleton').
female('Autumn Kelly').
female('Zara Phillips').
female('Beatrice').
female('Eugenie').
female('Louise Mountbatten Windsor').
female('Charlotte').
female('Savannah Phillips').
female('Isla Phillips').
female('Mia Grace Tindall').

/* married(Person1, Person2): Person1 married Person2 */
married('Elizabeth II', 'Philip').
married('Diana', 'Charles').
married('Charles', 'Camilla Parker Bowles').
married('Mark Phillips', 'Anne').
married('Anne', 'Timothy Laurence').
married('Sarah Ferguson', 'Andrew').
married('Sophie Rhys-jones', 'Edward').
married('William', 'Kate Middleton').
married('Autumn Kelly', 'Peter Phillips').
married('Zara Phillips', 'Mike Tindall').

/* divorced(Person1, Person2): Person1 divorces Person2 */
divorced('Diana', 'Charles').
divorced('Mark Phillips', 'Anne').
divorced('Sarah Ferguson', 'Andrew').

/* parent(Person1, Person2): Person1 is parent of Person2 */
parent('Elizabeth II', 'Charles').
parent('Philip', 'Charles').
parent('Elizabeth II', 'Anne').
parent('Philip', 'Anne').
parent('Elizabeth II', 'Andrew').
parent('Philip', 'Andrew').
parent('Elizabeth II', 'Edward').
parent('Philip', 'Edward').

parent('Diana', 'William').
parent('Charles', 'William').
parent('Diana', 'Harry').
parent('Charles', 'Harry').

parent('Mark Phillips', 'Peter Phillips').
parent('Anne', 'Peter Phillips').
parent('Mark Phillips', 'Zara Phillips').
parent('Anne', 'Zara Phillips').

parent('Sarah Ferguson', 'Beatrice').
parent('Andrew', 'Beatrice').
parent('Sarah Ferguson', 'Eugenie').
parent('Andrew', 'Eugenie').

parent('Sophie Rhys-jones', 'James Viscount Severn').
parent('Edward', 'James Viscount Severn').
parent('Sophie Rhys-jones', 'Louise Mountbatten Windsor').
parent('Edward', 'Louise Mountbatten Windsor').

parent('William', 'George').
parent('Kate Middleton', 'George').
parent('William', 'Charlotte').
parent('Kate Middleton', 'Charlotte').

parent('Autumn Kelly', 'Savannah Phillips').
parent('Peter Phillips', 'Savannah Phillips').
parent('Autumn Kelly', 'Isla Phillips').
parent('Peter Phillips', 'Isla Phillips').

parent('Zara Phillips', 'Mia Grace Tindall').
parent('Mike Tindall', 'Mia Grace Tindall').

/*--------------------------RULES------------------------------*/

is_married(Husband, Wife):-
    married(Husband, Wife);
    married(Wife, Husband).

is_divorced(Husband, Wife):-
    divorced(Husband, Wife);
    divorced(Wife, Husband).

husband(Person, Wife):-
    male(Person),
    female(Wife),
    is_married(Person, Wife),
    not(is_divorced(Person, Wife)).

wife(Person, Husband):-
    female(Person),
    is_married(Person, Husband),
    not(is_divorced(Person, Husband)).

father(Parent, Child):-
    male(Parent),
    parent(Parent, Child).

mother(Parent, Child):-
    female(Parent),
    parent(Parent, Child).

child(Child, Parent):-
    parent(Parent, Child).

son(Child, Parent):-
    male(Child),
    parent(Parent, Child).

daughter(Child, Parent):-
    female(Child),
    parent(Parent, Child).

/*TÚ LÀM*/

grandparent(GP,GC):-
    parent(GP,P),
    parent(P,GC).

grandmother(GM,GC):-
    female(GM),
    parent(GM,P),
    parent(P,GC).

grandfather(GF,GC):-
    male(GF),
    parent(GF,P),
    parent(P,GC).

grandchild(GC,GP):-
    parent(P,GC),
    parent(GP,P).

grandson(GS,GP):-
    male(GS),
    parent(P,GS),
    parent(GP,P).

granddaughter(GD,GP):-
    female(GD),
    parent(P,GD),
    parent(GP,P).

/*--------------------------> RULES CỦA BB <------------------------------*/

sibling(Person1,Person2):-
    mother(M1, Person1),
    mother(M2, Person2),
    father(F1, Person1),
    father(F2, Person2),
    M1 == M2, F1 == F2,
    Person1 \== Person2.

cousin(Person1, Person2):-
    parent(X, Person1),
    parent(Y, Person2),
    (cousin(X, Y);
    sibling(X, Y)).

brother(Person,Sibling):-
    sibling(Person, Sibling),
    male(Person).

sister(Person,Sibling):-
    sibling(Person, Sibling),
    female(Person).

brother_cousin(Person,Sibling):-
    cousin(Person, Sibling),
    male(Person).

sister_cousin(Person,Sibling):-
    cousin(Person, Sibling),
    female(Person).

aunt(Person,NieceNephew):-
    parent(X, NieceNephew), (
        sister(Person, X);
        sister_cousin(Person, X); 
        (
            wife(Person, Y),
            (brother(Y, X);
            brother_cousin(Y, X))
        )
    ).

uncle(Person,NieceNephew):-
    husband(Person, X),
    aunt(X, NieceNephew).

niece(Person,AuntUncle):-
    female(Person),
    (aunt(AuntUncle, Person); uncle(AuntUncle, Person)).

nephew(Person,AuntUncle):-
    male(Person),
    (aunt(AuntUncle, Person); uncle(AuntUncle, Person)).

/*--------------------------> END RULES CỦA BB <------------------------------*/
