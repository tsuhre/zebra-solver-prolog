# zebra-solver-prolog
### Final project for CS 3003. Basic zebra puzzle solver built after learning how to use Prolog.

## About the Puzzle
A zebra puzzle is a classic logic puzzle dating back to the early 60s. You are given a list of clues, and you must find the one unique solution to the puzzle. The final question(s) asks you something you would only know if you found the complete unique solution. This particular puzzle begins by telling you there are five houses in a row, all different colors. Each house has an owner with a different ethnicity, pet, drink, and cigarette brand. Then, using the clues provided, you must determine who drinks water, and who owns the zebra. This particular puzzle is very well known and is the reason for the puzzle's name (zebra). For more information: https://en.wikipedia.org/wiki/Zebra_Puzzle

## How it Works
Prolog is a declarative language, as opposed to an imperative language. This means that rather than specifying each individual step the computer must take, you instead give the computer a set of statements which must be true in order for its task to be complete. Using these statements, the system handles the execution details and finds a solution in which all requirements are met. In Prolog, after the program finds a solution, you can enter a semicolon to indicate that you want it to find another solution. However, for this project, the idea of the puzzle is that there is only one solution, so a semicolon will produce an output of "false."

### `solve()`
To solve the actual puzzle, all I had to do was define a system of "houses," which is just a list of five similar structures each with five blank attributes, and then give the clues to the program in code form. For example, instead of "The Englishman lives in the red house," I give the program this statement:
```prolog
member(house(red,englishman,_,_,_), Houses)
```
This statement basically tells the program that there exists a `house()` structure in the Houses list with attributes "red" and "englishman." A lot of the clues are similar to this one, but there are a few other kinds. For clues like "The Norwegian lives in the first house," the statement would be
```prolog
nth1(1, Houses, house(_,norwegian,_,_,_))
```
This tells the program that the `house()` structure at the 1st position in the Houses list has the second attribute "norwegian." I used `nth1()` instead of `nth0()` here to indicate to the program that I was using indexing starting at 1, not 0. Another kind of clue specifies positioning, such as "The green house is immediately to the right of the ivory house." The statement corresponding to this written as
```prolog
order(house(ivory,_,_,_,_), house(green,_,_,_,_), Houses)
```
This uses my helper function `order()` to tell the program that there is a `house()` with first attribute "ivory" that comes directly before a `house()` with first attribute "green." This is equivalent to saying that the green house is to the right of the ivory house. A very similar statement to this one is "The Norwegian lives next to the blue house." This one still deals with order, but does not specify which house comes first. The code for this statement is
```prolog
nextTo(house(_,norwegian,_,_,_), house(blue,_,_,_,_), Houses)
```
My `nextTo()` helper function uses my `order()` function twice to say that the houses could be in order AB or BA, as long as they are directly next to each other.

I converted each English clue to code inside of the `solve()` function, which can output the list of houses with filled in attributes once it finds a solution.

### `report()`, Helper Functions, `run`, and Sample Output
Now that I can find a solution, my `report()` function takes the raw result and presents it in a more readable way, with labeled columns. I also wrote the helper functions `waterDrinker()` and `zebraOwner()` to retrieve the answers to the specific questions at the end of the puzzle. Finally, I wrote the `run` function to solve the puzzle, generate the report, and answer the final questions, all in one simple command. Here is an example of the output this function generates:
```
1 ?- run.

Color   |  Nationality  |  Pet     |  Drink        |  Cigarette
-------------------------------------------------------------------

yellow  |  norwegian    |  fox     |  water        |  kools

blue    |  ukranian     |  horse   |  tea          |  chesterfields

red     |  englishman   |  snails  |  milk         |  oldgolds

ivory   |  spaniard     |  dog     |  orangejuice  |  luckystrikes

green   |  japanese     |  zebra   |  coffee       |  parliaments

-------------------------------------------------------------------

The norwegian drinks water.
The japanese owns the zebra.
true ;
false.

2 ?- 
```
This also demonstrates the program's response to being prompted for another solution, as previously mentioned in **How it Works**.

## How to Run It
To run this program, you must have SWI-Prolog installed. Then, in a terminal, navigate to the `zebra-solver-prolog` folder, and run the command
```bash
swipl zebra.pl
```
This runs the program in Prolog. Then, on the resulting command line `1 ?- `, run the command
```bash
run.
```
This will generate a solution to the puzzle and present it in the terminal.