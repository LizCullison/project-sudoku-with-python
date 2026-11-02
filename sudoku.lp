% Numbers and cells in a 9x9 Sudoku.
num(1..9).

% Every cell contains exactly one number.
1 { sudoku(X,Y,N) : num(N) } 1 :- num(X), num(Y).

% A number cannot appear twice in the same row.
:- sudoku(X,Y,N), sudoku(X,Y2,N), Y < Y2.

% A number cannot appear twice in the same column.
:- sudoku(X,Y,N), sudoku(X2,Y,N), X < X2.

% Identify the 3x3 box for each cell.
box(X,Y,BX,BY) :-
    num(X), num(Y),
    BX = (X-1)/3,
    BY = (Y-1)/3.

% A number cannot appear twice in the same 3x3 box.
:- sudoku(X,Y,N), sudoku(X2,Y2,N),
    X < X2,
    box(X,Y,BX,BY),
    box(X2,Y2,BX,BY).

% The solution must preserve all given clues.
:- initial(X,Y,N), not sudoku(X,Y,N).

% Display only the solved Sudoku.
#show sudoku/3.