emptyHouse(house(_,_,_,_,_)).

solve(Houses) :-
    /*
    There are 5 houses in a row, each a different color.
    Each house's owner has a different nationality, drinks a different
    beverage, smokes a different brand, and keeps a different pet.
    */

    % Creates a list of five houses, each with five blank attributes
    length(Houses, 5),
    maplist(emptyHouse, Houses).