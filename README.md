# Prolog Football League Analysis

This repository contains a Prolog program that analyzes football league data from `league_data.pl` and solves the tasks outlined in Assignment 1.

## Problem Statement

This assignment requires the development of a Prolog program to query and analyze data about a football league. The data is provided in the `league_data.pl` file, which includes facts about teams, players, matches, and goals. The program must implement several predicates to answer specific questions about the league.

## Files

* **`league_data.pl`**: The provided Prolog file containing the football league data (teams, players, matches, goals).
* **`Main.pl`**: The Prolog file containing the solution to the assignment, including the required predicates.
* **`README.md`**: This file, providing information about the repository and usage instructions.

## Data Structure (Facts in `league_data.pl`)

* `team(Name, Country, Num_of_winning_times)`: Represents a team with its name, country, and number of league wins.
* `player(Name, Team, Position)`: Represents a player with their name, team, and position.
* `match(Team1, Team2, Team1Goals, Team2Goals)`: Represents a match between two teams and their scores.
* `goals(Player, Num_of_scored_goals)`: Represents the number of goals scored by a player.

## Required Predicates (Tasks)

1.  **`players_in_team(Team, PlayersList)`** [0.75 mark]
    * Retrieves a list of all players in a specific team.
    * Example: `?- players_in_team(barcelona, L).`
    * Expected Output: `L = [messi, ter_stegen, de_jong].`

2.  **`team_count_by_country(Country, Count)`** [0.75 mark]
    * Counts the number of teams from a specific country.
    * Example: `?- team_count_by_country(spain, N).`
    * Expected Output: `N = 2.`

3.  **`most_successful_team(Team)`** [1 mark]
    * Finds the team with the most championship titles.
    * Example: `?- most_successful_team(T).`
    * Expected Output: `T = bayern_munich.`

4.  **`matches_of_team(Team, MatchesList)`** [1 mark]
    * Lists all matches where a specific team participated.
    * Example: `?- matches_of_team(barcelona, L).`
    * Expected Output: `L = [(barcelona, real_madrid, 3, 2), (liverpool, barcelona, 2, 2)].`

5.  **`num_matches_of_team(Team, Count)`** [0.25 mark]
    * Counts the amount of matches a team participated in.
    * Example: `?- num_matches_of_team(barcelona, N).`
    * Expected Output: `N = 2.`

6.  **`top_scorer(Player)`** [0.75 mark]
    * Finds the top goal scorer in the tournament.
    * Example: `?- top_scorer(P).`
    * Expected Output: `P = ronaldo.`

7.  **`most_common_position_in_team(Team, Position)`** [1.5 mark]
    * Finds the most common player position in a specific team.
    * Example: `?- most_common_position_in_team(barcelona, Pos).`
    * Expected Output: `Pos = forward.`

8.  **Bonus Task: Control Unneeded Backtracking** [0.5 mark]
    * Modify the predicates to prevent unnecessary backtracking and ensure only correct answers are returned.
    * Example of correct behavior: `?- team_count_by_country(spain,Count).` Expected Output: `Count = 2.`

## Usage

1.  Ensure you have a Prolog interpreter installed (e.g., SWI-Prolog).
2.  Clone this repository.
3.  Open the Prolog interpreter.
4.  Consult both `league_data.pl` and `Main.pl` (or your solution file) using `[league_data].` and `[Main].`.
5.  Run the queries as required by the assignment, using the provided examples as a guide.

## Notes

* This solution is based on the provided `league_data.pl` file.
* Please ensure your predicates produce the exact outputs provided in the examples.
* This repository is to help others understand the assignment and how to solve it.

## Author

[Mazen Nayef]# Prolog Football League Analysis - Assignment 1

This repository contains a Prolog program that analyzes football league data from `league_data.pl` and solves the tasks outlined in Assignment 1.
