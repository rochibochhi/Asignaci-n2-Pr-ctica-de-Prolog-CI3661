% base de conocimiento

dicta(leonardo, ci3661).
dicta(maria, ci3725).
dicta(pedro, ci2691).

cursa(ana, ci3661).
cursa(ana, ci3725).
cursa(juan, ci3661).
cursa(elena, ci2691).
cursa(elena, ci3725).

nota(ana, ci3661, 88).
nota(ana, ci3725, 70).
nota(juan, ci3661, 40). 
nota(elena, ci2691, 50).
% elena no tiene nota en ci3725 (la está cursando)


% prof dio clases a est en alguna materia
profesor_de(Prof, Est) :-
    dicta(Prof, Materia),
    cursa(Est, Materia).

% est aprobo mat (nota >= 50)
aprobado(Est, Mat) :-
    nota(Est, Mat, Nota),
    Nota >= 50.

% est aplazo al menos una materia (nota < 50)
aplazado(Est) :-
    nota(Est, _, Nota),
    Nota < 50.

% est cursa Mat pero no tiene nota registrada
cursando_sin_nota(Est, Mat) :-
    cursa(Est, Mat),
    not(nota(Est, Mat, _)).