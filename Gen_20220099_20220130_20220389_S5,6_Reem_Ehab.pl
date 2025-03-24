:- consult('league_data.pl').
:- dynamic goals/2, match/4, team/3, player/3.

% TASK 1: Get a list of all players in a specific team.
% @author Rana Ibrahim Bassiouny

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

% TASK 3: Find the team with the most championship titles.
% @author Youssef Joseph
most_successful_team(Team) :-
  find_most_successful(_, 0, Team).

find_most_successful(_, CurrentBestWins, Best) :-
  team(Team, _, Wins),
  Wins > CurrentBestWins,
  !,  % cut
  find_most_successful(Team, Wins, Best).

find_most_successful(BestTeam, _, BestTeam).  % Base Case

% TASK 4: List all matches where a specific team participated.
% @author Joseph Sameh
matches_of_team(Team, Matches) :-
  find_matches(Team, [], Matches).

find_matches(Team, Acc, Matches) :-
  match(T1, T2, G1, G2),
  (T1 = Team ; T2 = Team),
  not(my_member((T1, T2, G1, G2), Acc)),
  !, % Don't check other branches if success.
  find_matches(Team, [(T1, T2, G1, G2) | Acc], Matches).

find_matches(_, Matches, Matches).

% TASK 5: Count all matches where a specific team participated.
% @author Joseph Sameh
num_matches_of_team(Team, Count) :-
  matches_of_team(Team, Matches),
  my_length(Matches, Count).

% TASK 6: Find the top goal scorer in the tournament.
% @author Joseph Sameh
top_scorer(Player) :-
  goals(Player, G),
  not((goals(_, G2), G2 > G)),
  !. % Don't check other branches if success, to solve unneeded backtracking.

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


%%%%%%%%%%%%%%%%%%%%%%%%%%%% Helper functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_length([],0).
my_length([_|Tail], N):-
  my_length(Tail, TmpN),
  N is TmpN+1.

my_member(X, [X|_]).
my_member(X, [_|Tail]):-
  my_member(X, Tail).