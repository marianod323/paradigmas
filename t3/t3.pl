:- use_module(library(lists)).
% 1 - Defina um predicado zeroInit(L) que é verdadeiro se L for uma lista que inicia com o número 0 (zero).

zeroInit(L) :- L = [H|_], H = 0.

% 2 - Defina um predicado has5(L) que é verdadeiro se L for uma lista de 5 elementos.
%     Resolva este exercício sem usar um predicado auxiliar.

has5(L) :- L = [_,_,_,_,_].

% 3 - Defina um predicado hasN(L,N) que é verdadeiro se L for uma lista de N elementos.

hasN(L,N) :- length(L,N).

% 4 - Defina um predicado potN0(N,L), de forma que L seja uma lista de potências de 2, com expoentes de N a 0.

potN0(0,[1]).
potN0(N,L) :- C is 2^N, N1 is N-1, potN0(N1,J), L = [C|J].

% 5 - Defina um predicado zipmult(L1,L2,L3), de forma que cada elemento da lista
%     L3 seja o produto dos elementos de L1 e L2 na mesma posição do elemento de L3.

zipmult([_],[],[]).
zipmult([],[_],[]).
zipmult([],[],[]).
zipmult(L1,L2,L3) :- L1 = [HL1|TL1], L2 = [HL2|TL2], C is HL1*HL2, zipmult(TL1, TL2, LAUX), L3 = [C|LAUX].

% 6 - Defina um predicado potencias(N,L), de forma que L seja uma lista com as N
%     primeiras potências de 2, sendo a primeira 2^0 e assim por diante.

potencias(N,L) :- potenciasAUX(N, L1), reverse(L1, L).

potenciasAUX(0,[1]).
potenciasAUX(N,L) :- C is 2^N, N1 is N-1, potenciasAUX(N1,J), L = [C|J].

% 7 - Defina um predicado positivos(L1,L2), de forma que L2 seja uma lista só com os elementos positivos de L1

positivos([],[]).
positivos([H|T],L2) :- H > 0, positivos(T, Laux), L2 = [H|Laux].
positivos([_|T],L2) :- positivos(T, Laux), L2 = Laux.

% 8 - Considere que L1 e L2 sejam permutações de uma lista de elementos distintos, sem repetições.
%     Sabendo disso, defina um predicado mesmaPosicao(A,L1,L2) para verificar se um elemento A está
%     na mesma posição nas listas L1 e L2.

mesmaPosicao(A,[A|_],[A|_]) :- !.
mesmaPosicao(A,[_|T1],[_|T2]) :- mesmaPosicao(A, T1, T2).

% 9 - Dada uma lista de N alunos, deseja-se escolher NP alunos (NP < N) para formar uma comissão.
%     Para isso, defina um predicado comissao(NP,LP,C), que permita gerar as possíveis combinações
%     C com NP elementos da lista LP.

% 10 - Você deverá definir um predicado azulejos(NA, NQ), de forma que NQ seja o número de quadrados
%      que se deve montar com NA azulejos.

azulejos(0,0) :- !.
azulejos(NA,NQ) :- sqrt(NA,TAM), floor(TAM,TAM1), TAM2 is NA-TAM1^2, azulejos(TAM2, NQ1), NQ is NQ1+1.
