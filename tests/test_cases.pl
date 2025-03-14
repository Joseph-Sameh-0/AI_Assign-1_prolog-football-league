:- consult('../src/assignment1.pl').
:- dynamic most_common_position_in_team/2, top_scorer/1, num_matches_of_team/2, matches_of_team/2, most_successful_team/1, team_count_by_country/2, players_in_team/2.

run_tests :-
    % test_players_in_team,
    test_team_count_by_country,
    test_most_successful_team,
    test_matches_of_team,
    test_num_matches_of_team,
    test_top_scorer,
    % test_most_common_position_in_team,
    writeln('All tests passed!').

test_players_in_team :-
    players_in_team(barcelona, L),
    L == [messi, ter_stegen, de_jong].

test_team_count_by_country :-
    team_count_by_country(spain, N),
    N == 2.

test_most_successful_team :-
    most_successful_team(T),
    T == bayern_munich.

test_matches_of_team :-
    matches_of_team(barcelona, L),
    L == [(liverpool, barcelona, 2, 2), (barcelona, real_madrid, 3, 2)].

test_num_matches_of_team :-
    num_matches_of_team(barcelona, N),
    N == 2.

test_top_scorer :-
    top_scorer(P),
    P == ronaldo.

test_most_common_position_in_team :-
    most_common_position_in_team(barcelona, Pos),
    Pos == forward.
