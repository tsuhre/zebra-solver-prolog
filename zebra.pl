emptyHouse(house(_,_,_,_,_)).

% Helper function which determines whether list items A and B are in consecutive left-to-right order A, B
order(A, B, List) :-
    nth1(N1, List, A),
    N2 is N1 + 1,
    nth1(N2, List, B).

% Helper function which determines whether list items A and B are next to each other
nextTo(A, B, List) :-
    order(A, B, List) ; order(B, A, List).

% Solves the zebra puzzle
solve(Houses) :-
    /*
    There are 5 houses in a row, each a different color.
    Each house's owner has a different nationality, drinks a different
    beverage, smokes a different brand, and keeps a different pet.
    */

    % Creates a list of five houses, each with five blank attributes
    length(Houses, 5),
    maplist(emptyHouse, Houses),
    
    % Clues:

    % The Englishman lives in the red house.
    member(house(red,englishman,_,_,_), Houses),

    % The Spaniard owns the dog.
    member(house(_,spaniard,dog,_,_), Houses),

    % Coffee is drunk in the green house.
    member(house(green,_,_,coffee,_), Houses),

    % The Ukrainian drinks tea.
    member(house(_,ukranian,_,tea,_), Houses),

    % The green house is immediately to the right of the ivory house.
    order(house(ivory,_,_,_,_), house(green,_,_,_,_), Houses),

    % The Old Gold smoker owns snails.
    member(house(_,_,snails,_,oldgolds), Houses),

    % Kools are smoked in the yellow house.
    member(house(yellow,_,_,_,kools), Houses),

    % Milk is drunk in the middle house.
    nth1(3, Houses, house(_,_,_,milk,_)),

    % The Norwegian lives in the first house.
    nth1(1, Houses, house(_,norwegian,_,_,_)),
    
    % The Chesterfields smoker lives next to the man with the fox.
    nextTo(house(_,_,_,_,chesterfields), house(_,_,fox,_,_), Houses),

    % Kools are smoked in the house next to the house where the horse is kept.
    nextTo(house(_,_,_,_,kools), house(_,_,horse,_,_), Houses),

    % The Lucky Strike smoker drinks orange juice.
    member(house(_,_,_,orangejuice,luckystrikes), Houses),

    % The Japanese smokes Parliaments.
    member(house(_,japanese,_,_,parliaments), Houses),
    
    % The Norwegian lives next to the blue house.
    nextTo(house(_,norwegian,_,_,_), house(blue,_,_,_,_), Houses),

    % Who drinks water?
    % Tells the solver there exists a house in which water is drank.
    member(house(_,_,_,water,_), Houses),

    % Who owns the zebra?
    % Tells the solver there exists a house with a zebra.
    member(house(_,_,zebra,_,_), Houses).

% Shows solution in a more clean-looking format
report(Houses) :-
    % Formatting: ~n = newline, ~w = print next item from list, ~t~x = pad with spaces up to column x. This line just prints the header for the result.
    format("~n~w~t~8||  ~w~t~24||  ~w~t~35||  ~w~t~51||  ~w~n", ["Color", "Nationality", "Pet", "Drink", "Cigarette"]),

    % Print horizontal line
    format("-------------------------------------------------------------------~n~n"),

    % Iterates through every item in Houses, assigning a variable name to each attribute of a house.
    forall(member(house(Col, Nat, Pet, Dri, Cig), Houses),

        % Same formatting as header, prints each specific attribute in corresponding column.
        format("~w~t~8||  ~w~t~24||  ~w~t~35||  ~w~t~51||  ~w~n~n", [Col, Nat, Pet, Dri, Cig])),
    
    % Print horizontal line
    format("-------------------------------------------------------------------~n").