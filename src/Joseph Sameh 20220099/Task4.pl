:- consult('../../data/league_data.pl').
:- dynamic match/4.

% TASK 4: List all matches where a specific team participated.
% @author Joseph Sameh
matches_of_team(Team, Matches) :-
  find_matches(Team, [], Matches).

find_matches(Team, Acc, Matches) :-
  match(T1, T2, G1, G2),
  (T1 = Team ; T2 = Team),
  not(member((T1, T2, G1, G2), Acc)), % the match not in Acc
  !, % Don't check other branches if success.
  find_matches(Team, [(T1, T2, G1, G2) | Acc], Matches).

find_matches(_, Matches, Matches).