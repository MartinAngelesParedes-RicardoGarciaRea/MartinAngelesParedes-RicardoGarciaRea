% Desarrolle un predicado que permita validar un NIP de una banco que 
% Responde a la siguiente gramatica
% Nip ::= <Digito> ' ' <Digito> ' ' <Digito> ' ' <Digito>
% Digito ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

latom_lstring([],[]).
latom_lstring([F|C],R) :- latom_lstring(C,S), atom_string(F,SF), append([SF],S,R).

preparar_string(Term,LS) :-
	atom(Term),
	atom_string(Term,Str),
	preparar_string(Str,LS).

preparar_string(Str,LS) :-
	string(Str),
	string_chars(Str,LAC),
	latom_lstring(LAC,LS).

digito(N) :- N == "0"; N =="1"; N == "2"; N =="3"; N == "4"; N =="5"; N == "6"; N =="7"; N == "8"; N =="9".
digitos([F|[]]) :- digito(F).
digitos([F|C]) :- digito(F),digitos(C).

cuenta_elementos([],0).
cuenta_elementos([_|L],N) :- cuenta_elementos(L,Tam), N is Tam+1.

inicio([C|P],P) :- C == "2".
iniciodos([C|P],P) :- C =="1".
seg([C|P],P):- C =="0"; C =="1"; C =="2"; C =="3"; C =="4"; C =="5".
octeto(L) :- preparar_string(L,LS),inicio(LS,P),seg(P,X),seg(X,_),cuenta_elementos(LS,B),B == 3.
octeto(L) :- preparar_string(L,LS),iniciodos(LS,P),digitos(P),cuenta_elementos(LS,B),B == 3.
octeto(L) :- preparar_string(L,LS),digitos(LS),cuenta_elementos(LS,B),B == 2.
octeto(L) :- preparar_string(L,LS),digitos(LS),cuenta_elementos(LS,B),B == 1.
