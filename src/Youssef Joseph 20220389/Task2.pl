:- consult('../../data/league_data.pl').
:- consult('../helperFunctions.pl').
:- dynamic my_member/2, team/3, my_length/2.

% TASK 2: Count how many teams are from a specific country.
% @author Youssef Joseph
team_count_by_country(Country, Count) :-
    find_teams(Country, [], Teams),
    my_length(Teams, Count).

find_teams(Country, Acc, Teams) :-
    team(Team, Country, _),
    \+ my_member(Team, Acc),    % \+ not in Acc
    !,
    find_teams(Country, [Team | Acc], Teams).

find_teams(_, Teams, Teams).  % Base case

