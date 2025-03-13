:- consult('../data/league_data.pl').
:- dynamic goals/2, match/4.
% Bonus Task: Control Unneeded backtracking in all predicates.

% TASK 1: Get a list of all players in a specific team.

% TASK 2: Count how many teams are from a specific country.

% TASK 3: Find the team with the most championship titles.

% TASK 4: List all matches where a specific team participated.
% @author Joseph Sameh
matches_of_team(Team, Matches) :-
  find_matches(Team, [], Matches).

find_matches(Team, Acc, Matches) :-
  match(T1, T2, G1, G2),
  (T1 = Team ; T2 = Team),
  \+ member((T1, T2, G1, G2), Acc), % the match not in Acc
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
  not((goals(_, G2), G2 > G)).

% TASK 7: Find the most common position in a specific team.

%%%%%%%%%%%%%%%%%%%%%%%%%%%% Helper functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%
my_length([],0).

my_length([_|Tail], N):-
  my_length(Tail, TmpN),
  N is TmpN+1.