emptyHouse(house(_,_,_,_,_)).

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

    % The Old Gold smoker owns snails.
    member(house(_,_,snails,_,oldgolds), Houses),

    % Kools are smoked in the yellow house.
    member(house(yellow,_,_,_,kools), Houses),

    % Milk is drunk in the middle house.
    nth1(3, Houses, house(_,_,_,milk,_)),

    % The Norwegian lives in the first house.
    nth1(1, Houses, house(_,norwegian,_,_,_)),

    % The Lucky Strike smoker drinks orange juice.
    member(house(_,_,_,orangejuice,luckystrikes), Houses),

    % The Japanese smokes Parliaments.
    member(house(_,japanese,_,_,parliaments), Houses),

    % Who drinks water?
    % Tells the solver there exists a house in which water is drank.
    member(house(_,_,_,water,_), Houses),

    % Who owns the zebra?
    % Tells the solver there exists a house with a zebra.
    member(house(_,_,zebra,_,_), Houses).