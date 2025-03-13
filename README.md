# AI Assignment #1 Prolog Football League Assignment

## Overview
This Prolog program processes football league data, including teams, players, matches, and goal stats. The program implements several queries to extract useful insights.

## Setup
1. Install SWI-Prolog (if not installed).
2. Clone the repository: git clone https://github.com/Joseph-Sameh-0/AI_Assign-1_prolog-football-league.git
3. Navigate to the project directory: cd prolog-football-league
4. Run the queries in SWI-Prolog: swipl src/assignment1.pl

## Queries
- `players_in_team(Team, L).` → List all players in a given team.
- `team_count_by_country(Country, N).` → Count teams from a specific country.
- `most_successful_team(T).` → Find the team with the most league wins.
- `matches_of_team(Team, L).` → List matches a team participated in.
- `num_matches_of_team(Team, N).` → Count matches a team participated in.
- `top_scorer(P).` → Find the player with the most goals.
- `most_common_position_in_team(Team, Pos).` → Find the most common position in a team.

## Testing
To run the test cases: swipl tests/test_cases.pl