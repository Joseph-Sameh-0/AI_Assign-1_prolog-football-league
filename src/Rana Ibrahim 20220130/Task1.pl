:- consult('../../data/league_data.pl').
% TASK 1: Get a list of all players in a specific team.
%base case%
is_member(X,[X|_]):- !.
%recursive case%
is_member(X,[_|T]):-
    is_member(X,T).

%base case%
my_append([],L2,L2).
%recursive case%
my_append([X|T],L2,[X|Result]):-
    my_append(T,L2,Result).
    

%interface%
players_in_team(Team, L):-
    players_in_team(Team,[], L).

%recursive case%
players_in_team(Team, List, Result):-
    player(X, Team, _),
    \+ is_member(X,List),
    my_append([X],List,NewList),
    !,
    players_in_team(Team, NewList, Result).

%base case%
players_in_team(_, List, List).