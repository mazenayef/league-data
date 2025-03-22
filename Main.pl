% Include the league data
:-consult(league_data).


% Task 1: Get a list of all teams
% Get a list of all players in a specific team
players_in_team(Team, Players) :-
    findall_players(Team, [], Players).

% Helper predicate to accumulate players
findall_players(Team, Acc, Players) :-
    % Append player to accumualtor if not already found
    player(Player, Team, _),
    \+ member(Player, Acc),
    append(Acc, [Player], NewAcc),
    findall_players(Team, NewAcc, Players).

findall_players(Team, Acc, Acc) :-
    % If no more players are found, return the accumulator
    \+ (player(Player, Team, _), \+ member(Player, Acc)).




% Task 2: Count how many teams are from a specific country
% Count teams from a specific country
team_count_by_country(Country, Count) :-
    countall_teams(Country, [], Count).

% Helper predicate to count teams
countall_teams(Country, Acc, Count) :-
    % Append team to accumualtor if not already found
    team(Team, Country, _),
    \+ member(Team, Acc),
    append(Acc, [Team], NewAcc),
    countall_teams(Country, NewAcc, Count).

countall_teams(Country, Acc, Count) :-
    % If no more teams are found, return the accumulator
    \+ (team(Team, Country, _), \+ member(Team, Acc)),
    length(Acc, Count).




% Task 3: Find the team with the most championship titles
% Get the most successful team
most_successful_team(TeamName) :-
    % Initialize Max and BestTeam outside the loop
    findsuccesful_team(0, '', TeamName).

findsuccesful_team(Max, BestTeam, TeamName) :-
    team(T, _, Num),
    Num > Max,
    NewMax is Num,
    findsuccesful_team(NewMax, T, TeamName).

findsuccesful_team(Max, BestTeam, BestTeam).




% Task 4: List all matches where a specific team participated
% Get all matches played by a team
matches_of_team(Team, Matches) :-
    findall_matches(Team, [], AllMatches),
    remove_duplicates(AllMatches, Matches).

% Helper predicate to accumulate home matches
findall_matches(Team, Acc, AllMatches) :-
    % Find a home match
    match(Team, Opponent, TeamGoals, OpponentGoals),
    % Create match details
    MatchDetails = (Team, Opponent, TeamGoals, OpponentGoals),
    % Check if not already in accumulator
    \+ member(MatchDetails, Acc),
    % Add to accumulator
    append(Acc, [MatchDetails], NewAcc),
    % Continue recursion
    findall_matches(Team, NewAcc, AllMatches).

% Helper predicate to accumulate away matches
findall_matches(Team, Acc, AllMatches) :-
    % Find an away match
    match(Opponent, Team, OpponentGoals, TeamGoals),
    % Create match details
    MatchDetails = (Opponent, Team, OpponentGoals, TeamGoals),
    % Check if not already in accumulator
    \+ member(MatchDetails, Acc),
    % Add to accumulator
    append(Acc, [MatchDetails], NewAcc),
    % Continue recursion
    findall_matches(Team, NewAcc, AllMatches).

% Base case: no more matches to find
findall_matches(Team, Acc, Acc) :-
    % If no more matches are found, return the accumulator
    \+ ((match(Team, Opp, _, _), \+ member((Team, Opp, _, _), Acc));
        (match(Opp, Team, _, _), \+ member((Opp, Team, _, _), Acc))).

% Remove duplicates from a list
remove_duplicates([], []).
remove_duplicates([Head|Tail], Result):-
    member(Head, Tail),!,
    remove_duplicates(Tail, Result).
remove_duplicates([Head|Tail],[Head|Result]):-
    remove_duplicates(Tail, Result).




% Task 5: count all matches where a specific team participated
% Count all matches where a specific team participated
num_matches_of_team(Team, Count) :-
    % Find all matches played by the specific team
    matches_of_team(Team, Matches),
    % Count the number of matches
    length(Matches, Count).



% Task 6: Get the number of goals scored by a specific player
% Get the greatest number of goals scored by a player
top_scorer(Player) :-
    % Initialize Max and BestPlayer outside the loop
    findgreatest_scorer(0, '', Goals, Player).

% Helper predicate to find the player with the most goals
findgreatest_scorer(Max, BestPlayer, Goals, Player) :-
    goals(Player, Num),
    Num > Max,
    NewMax is Num,
    findgreatest_scorer(NewMax, Player, Goals, Player).

findgreatest_scorer(Max, BestPlayer, Max, BestPlayer).




% Task 7: Find the Most Common Position in a Specific Team
% Find the most common position in the specific team
most_common_position_in_team(Team, Position) :-
    % Find all players in the team
    players_in_team(Team, Players),
    % Initialize with empty position
    count_all_positions(Players, [], PositionCounts),
    % Find the most common position
    find_max_position(PositionCounts, '', 0, Position).

% Count occurrences of each position
count_all_positions([], PositionCounts, PositionCounts).
count_all_positions([Player|Players], Acc, PositionCounts) :-
    player(Player, _, Position),
    % Check if position already in accumulator
    update_position_count(Position, Acc, NewAcc),
    % Continue recursion
    count_all_positions(Players, NewAcc, PositionCounts).

% Update or add position count in accumulator
update_position_count(Position, [], [(Position, 1)]).
update_position_count(Position, [(Position, Count)|Rest], [(Position, NewCount)|Rest]) :-
    % Position already exists, increment count
    NewCount is Count + 1.
update_position_count(Position, [(OtherPos, Count)|Rest], [(OtherPos, Count)|NewRest]) :-
    % Different position, check rest of list
    Position \= OtherPos,
    update_position_count(Position, Rest, NewRest).

% Find position with the highest count
find_max_position([], MaxPos, _, MaxPos).
find_max_position([(Position, Count)|Rest], CurrMaxPos, CurrMaxCount, MaxPos) :-
    Count > CurrMaxCount,
    % New max found
    find_max_position(Rest, Position, Count, MaxPos).
find_max_position([(Position, Count)|Rest], CurrMaxPos, CurrMaxCount, MaxPos) :-
    Count =< CurrMaxCount,
    % Not a new max
    find_max_position(Rest, CurrMaxPos, CurrMaxCount, MaxPos).

