/*--------------------------FACTS------------------------------*/

/* Males */
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

/* Females */
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

/* Married */
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

/* Divorced */
divorced('Diana', 'Charles').
divorced('Mark Phillips', 'Anne').
divorced('Sarah Ferguson', 'Andrew').

/*Parent of*/
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

married(X,Y):- married(Y,X).

divorced(X,Y):- divorced(Y,X).

husband(Person, Wife):-
    male(Person),
    married(Person, Wife),
    not(divorced(Person, Wife)).

wife(Person, Husband):-
    female(Person),
    married(Person, Husband),
    not(divorced(Person, Husband)).

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

/*--------------------------> RULES CỦA BB <------------------------------*/

sibling(Person1,Person2):-
    parent(X, Person1),
    parent(X, Person2).

cousin(Person1, Person2):-
    parent(X, Person1),
    parent(Y, Person1),
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
    sister(Person, mother(NieceNephew));
    sister(Person, father(NieceNephew));
    sister_cousin(Person, father(NieceNephew));
    sister_cousin(Person, mother(NieceNephew)).


uncle(Person,NieceNephew):-
    brother(Person, father(NieceNephew));
    brother(Person, mother(NieceNephew));
    brother_cousin(Person, mother(NieceNephew));
    brother_cousin(Person, father(NieceNephew)).


niece(Person,AuntUncle):-
    female(Person),
    (aunt(AuntUncle, Person); uncle(AuntUncle, Person)).


nephew(Person,AuntUncle):-
    male(Person),
    (aunt(AuntUncle, Person); uncle(AuntUncle, Person)).

/*--------------------------> END RULES CỦA BB <------------------------------*/