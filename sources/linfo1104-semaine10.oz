{Browse 12}

declare X in
{Browse X}

X=123

declare X in
thread {Browse X+1} end
thread X=20 end

declare
proc {Disp S}
   case S of X|S2 then {Browse X} {Disp S2} end
end

% Un agent -> permanent
declare S in
thread {Disp S} end

declare S2 in
S=a|b|c|S2

declare S3 in
S2=e|r|t|S3

% Un producteur
declare
fun {Prod N} {Delay 1000} N|{Prod N+1} end

% Un producteur-consommateur
declare S in
thread S={Prod 1} end
thread {Disp S} end

% Un transformateur
declare
fun {Trans S}
   case S of X|S2 then X*X|{Trans S2} end
end

% Un pipeline
declare S1 S2 in
thread S1={Prod 1} end
thread S2={Trans S1} end
thread {Disp S2} end


% Programme sequentiel versus concurrent
declare
fun {CreateList N M}
   {Delay 1000} % Calcul lent!
   if N>M then nil
   else N|{CreateList N+1 M} end
end
fun {SumList L A}
   case L of nil then nil
   [] H|T then A+H|{SumList T A+H} end
end

% Un exemple sequentiel (batch)
declare L M in
{Browse start}
L={CreateList 1 10}  % [1 2 3 ... 10]
M={SumList L 0}     % [1 3 6 ... ]
{Browse M}

% Un exemple concurrent (incremental)
declare L M in
{Browse start}
thread L={CreateList 1 10} end
thread M={SumList L 0} end
{Browse M}