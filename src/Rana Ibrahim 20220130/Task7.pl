:- consult('../../data/league_data.pl').
% TASK 7: Find the most common position in a specific team.
% @author Rana Ibrahim Bassiouny
%interface%  
forward_position(Team,Result1):-
    forward_position(Team,[],Result1).
%recursive case%
forward_position(Team,Acc,Result1):-
    player(X, Team, forward),
    \+ is_member(X,Acc),
    !,
    forward_position(Team, [X|Acc], Result1).
%base case%
forward_position(_,Acc,Acc).

%interface%  
midfielder_position(Team,Result2):-
    midfielder_position(Team,[],Result2).
%recursive case%
midfielder_position(Team,Acc,Result2):-
    player(X, Team, midfielder),
    \+ is_member(X,Acc),
    !,
    midfielder_position(Team, [X|Acc], Result2).
%base case%
midfielder_position(_,Acc,Acc).

%interface%  
goalkeeper_position(Team,Result3):-
    goalkeeper_position(Team,[],Result3).
%recursive case%
goalkeeper_position(Team,Acc,Result3):-
    player(X, Team, goalkeeper),
    \+ is_member(X,Acc),
    !,
    goalkeeper_position(Team, [X|Acc], Result3).
%base case%
goalkeeper_position(_,Acc,Acc).

%interface%  
defender_position(Team,Result4):-
    defender_position(Team,[],Result4).
%recursive case%
defender_position(Team,Acc,Result4):-
    player(X, Team, defender),
    \+ is_member(X,Acc),
    !,
    defender_position(Team, [X|Acc], Result4).
%base case%
defender_position(_,Acc,Acc).
    
  
%interface%
most_common_position_in_team(Team,Common):-
    forward_position(Team,Result1),
    my_length(Result1,N1),
    midfielder_position(Team,Result2),
    my_length(Result2,N2),
    goalkeeper_position(Team,Result3),
    my_length(Result3,N3),
    defender_position(Team,Result4),
    my_length(Result4,N4),
    most_common_position_in_team(N1,N2,N3,N4,Common).
  
most_common_position_in_team(N1,N2,N3,N4,Common):-
    (   N1 >= N2, N1 >= N3, N1 >= N4 , Common = forward, ! ) ;
    (   N2 >= N1, N2 >= N3, N2 >= N4 , Common = midfielder, !);
    (   N3 >= N1, N3 >= N2, N3 >= N4 , Common = goalkeeper, ! );
    Common = defender.

    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ANOTHER ANSWER %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    
%interface%  
team_position(Team,Result):-
    team_position(Team,[],[],Result).
%recursive case%
team_position(Team,Acc,Total,Result):- 
    player(X, Team, Y),
    \+ is_member(X,Acc),
    !,
    team_position(Team, [X|Acc],[Y|Total], Result).
%base case%
team_position(_,_,Acc,Acc).

last_el([X],X):- !.
    
last_el([_|T],X):-
    last_el(T,X).
    
    
%interface%
most_common_position_in_team(Team,Common):-
    team_position(Team,Result),
    last_el(Result,Common).
