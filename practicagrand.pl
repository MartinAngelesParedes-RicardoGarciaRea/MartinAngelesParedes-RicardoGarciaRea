% Desarrollo una gramatica bnf (como la del video) para validar una 
% direccion ipv4 asi como una mascara de red.
% https://es.wikipedia.org/wiki/M%C3%A1scara_de_red#Tabla_de_m%C3%A1scaras_de_red
% Realice la implementacion de dicha gramatica en prolog donde
% se pueda validar la cadena donde esta esa ip o mascara ejemplo

%ip("192.168.1.1").
%true.
%ip("256.168.1.1").
%false.
%maskR("255.255.255.0").
%true.
%maskR("255.255.255.1").
%false.

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

valmak(N,NUM) :- N == "128",NUM = 128; N == "192",NUM = 192; N == "224",NUM = 224; N == "240",NUM = 240;
            N == "248",NUM = 248; N == "252",NUM = 252; N == "254",NUM = 254; N == "255",NUM = 255; N == "0",NUM = 0.

maymask(MAY,MEN) :- MAY >= MEN.

darCabeza([L|P],L,P).
ip(L) :- split_string(L,"."," ",[F|C]),octeto(F),
		 darCabeza(C,CA,CU),octeto(CA),darCabeza(CU,CAA,CUU),
		 octeto(CAA),darCabeza(CUU,CAAA,_),octeto(CAAA).
maskR(L) :- split_string(L,"."," ",[F|C]),valmak(F,NUM1),darCabeza(C,CA,CU),valmak(CA,NUM2),
darCabeza(CU,CAA,CUU),valmak(CAA,NUM3),darCabeza(CUU,CAAA,_),valmak(CAAA,NUM4),maymask(NUM1,NUM2),
maymask(NUM2,NUM3),maymask(NUM3,NUM4).