:- consult('../../data/league_data.pl').
:- consult('../helperFunctions.pl').
% TASK 1: Get a list of all players in a specific team.

%interface%
players_in_team(Team, L):-
    players_in_team(Team,[], L).

%recursive case%
players_in_team(Team, List, Result):-
    player(X, Team, _),
    \+ my_member(X,List),
    !,
    players_in_team(Team, [X|List], Result).

%base case%
players_in_team(_, List, List).