/*--------------------------FACTS------------------------------*/

/* male(Person) : Person is a man */
male('Philip').
male('Charles').
male('Mark Phillips').
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

is_married(Husband, Wife):- married(Husband, Wife).
is_married(Husband, Wife):- married(Wife, Husband).

is_divorced(Husband, Wife):- divorced(Husband, Wife).
is_divorced(Husband, Wife):- divorced(Wife, Husband).

husband(Person, Wife):- male(Person), female(Wife), is_married(Person, Wife), not(is_divorced(Person, Wife)).

wife(Person, Husband):- female(Person), is_married(Person, Husband), not(is_divorced(Person, Husband)). 

father(Parent, Child):- male(Parent), parent(Parent, Child).

mother(Parent, Child):- female(Parent), parent(Parent, Child).

child(Child, Parent):- parent(Parent, Child).

son(Child, Parent):- male(Child), parent(Parent, Child).

daughter(Child, Parent):- female(Child), parent(Parent, Child).

/*TÚ LÀM*/

grandparent(GP,GC):- parent(GP,P), parent(P,GC).

grandmother(GM,GC):- female(GM), grandparent(GM,GC).

grandfather(GF,GC):- male(GF), grandparent(GF,GC).

grandchild(GC,GP):- grandparent(GP,GC).

grandson(GS,GP):- male(GS), grandchild(GS, GP).

granddaughter(GD,GP):- female(GD), grandchild(GD, GP).

/*--------------------------> RULES CỦA BB <------------------------------*/

/*--------------------------> END RULES CỦA BB <------------------------------*/

parents(Father, Mother, Child) :- father(Father, Child), mother(Mother, Child).

sibling(Person1,Person2):- parents(Father, Mother, Person1), parents(Father, Mother, Person2), diff(Person1, Person2).

cousin(Person1, Person2):- parent(X, Person1), parent(Y, Person2), cousin(X, Y).
cousin(Person1, Person2):- parent(X, Person1), parent(Y, Person2), sibling(X, Y).

brother(Person,Sibling):- sibling(Person, Sibling), male(Person).

sister(Person,Sibling):- sibling(Person, Sibling), female(Person).

brother_cousin(Person,Sibling):- cousin(Person, Sibling), male(Person).

sister_cousin(Person,Sibling):- cousin(Person, Sibling), female(Person).

aunt(Person, NieceNephew):- parent(X, NieceNephew),sister(Person, X).
aunt(Person, NieceNephew):- parent(X, NieceNephew),sister_cousin(Person, X).
aunt(Person, NieceNephew):- parent(X, NieceNephew),wife(Person, Y),brother(Y, X).
aunt(Person, NieceNephew):- parent(X, NieceNephew),wife(Person, Y),brother_cousin(Y, X).

uncle(Person,NieceNephew):- parent(X, NieceNephew),husband(Person, Y),sister(Y, X).
uncle(Person,NieceNephew):- parent(X, NieceNephew),husband(Person, Y),sister_cousin(Y, X).
uncle(Person,NieceNephew):- parent(X, NieceNephew),brother(Person, X).
uncle(Person,NieceNephew):- parent(X, NieceNephew),brother_cousin(Person, X).

niece(Person,AuntUncle):- female(Person),aunt(AuntUncle, Person).
niece(Person,AuntUncle):- female(Person),uncle(AuntUncle, Person).

nephew(Person,AuntUncle):- male(Person),aunt(AuntUncle, Person).
nephew(Person,AuntUncle):- male(Person),uncle(AuntUncle, Person).