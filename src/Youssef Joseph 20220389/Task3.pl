:- consult('../../data/league_data.pl').
:- dynamic team/3.

% % TASK 3: Find the team with the most championship titles.
% % @author Youssef Joseph
most_successful_team(Team) :-
    find_most_successful(_, 0, Team).

find_most_successful(_, CurrentBestWins, Best) :-
    team(Team, _, Wins),
    Wins > CurrentBestWins,
    !,  % cut
    find_most_successful(Team, Wins, Best).

find_most_successful(BestTeam, _, BestTeam).  % Base Case

