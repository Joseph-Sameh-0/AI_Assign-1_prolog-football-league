:- consult('../../data/league_data.pl').
:- consult('Task4.pl').
:- consult('../helperFunctions.pl').
:- dynamic my_length/2, matches_of_team/2.

% TASK 5: Count all matches where a specific team participated.
% @author Joseph Sameh
num_matches_of_team(Team, Count) :-
  matches_of_team(Team, Matches),
  my_length(Matches, Count).
