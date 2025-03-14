:- consult('../../data/league_data.pl').
:- dynamic goals/2.

% TASK 6: Find the top goal scorer in the tournament.
% @author Joseph Sameh
top_scorer(Player) :-
  goals(Player, G),
  not((goals(_, G2), G2 > G)),
  !.