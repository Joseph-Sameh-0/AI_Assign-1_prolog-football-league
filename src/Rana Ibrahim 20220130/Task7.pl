:- consult('../../data/league_data.pl').
:- consult('../helperFunctions.pl').
:- dynamic my_length/2, player/3, my_member/2.

% TASK 7: Find the most common position in a specific team.
% @author Rana Ibrahim Bassiouny

%interface%
team_position(Team,Pos,Result4):-
    team_position(Team,[],Pos,Result4).
%recursive case%
team_position(Team,Acc,Pos,Result4):-
    player(X, Team, Pos),
    \+ my_member(X,Acc),
    !,
    team_position(Team, [X|Acc], Pos, Result4).
%base case%
team_position(_,Acc,_,Acc).


%interface%
most_common_position_in_team(Team,Common):-
    team_position(Team,forward,Result1),
    my_length(Result1,N1),
    team_position(Team,midfielder,Result2),
    my_length(Result2,N2),
    team_position(Team,goalkeeper,Result3),
    my_length(Result3,N3),
    team_position(Team,defender,Result4),
    my_length(Result4,N4),
    most_common_position_in_team(N1,N2,N3,N4,Common).

most_common_position_in_team(N1,N2,N3,N4,Common):-
    (   N1 >= N2, N1 >= N3, N1 >= N4 , Common = forward, ! ) ;
    (   N2 >= N1, N2 >= N3, N2 >= N4 , Common = midfielder, !);
    (   N3 >= N1, N3 >= N2, N3 >= N4 , Common = goalkeeper, ! );
    Common = defender.

