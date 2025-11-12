% base de conocimiento, prelaciones directas

prela(ci2691, ci3661). % ci2691 prela a ci3661
prela(ci2525, ci2691).
prela(ci2691, ci3641).
prela(ci3641, ci3725).
prela(ci3725, ci3825). % ci3725 prela a ci3825
prela(ma1111, ci2525).


% A es prelacion directa de B

prelacion_directa(A, B) :- prela(A, B).


% A es prelacion directa o indirecta de B, evitando ciclos

prelacion_total(A, B) :-
    prelacion_total_aux(A, B, [A]).

prelacion_total_aux(A, B, _) :-
    prela(A, B).

prelacion_total_aux(A, B, Visitadas) :-
    prela(A, C),
    \+ member(C, Visitadas),
    prelacion_total_aux(C, B, [C | Visitadas]).