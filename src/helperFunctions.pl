%%%%%%%%%%%%%%%%%%%%%%%%%%%% Helper functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_length([],0).

my_length([_|Tail], N):-
  my_length(Tail, TmpN),
  N is TmpN+1.

my_member(X, [X|_]).
my_member(X, [_|Tail]):-
  my_member(X, Tail).