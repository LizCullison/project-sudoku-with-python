import sys
from clingo.application import Application, clingo_main
from sudoku_board import Sudoku

class ClingoApp(Application):
    def __init__(self, name):
        self.program_name = name
        
    def main(self, ctl, files):
        ctl.load("sudoku.lp")

        for file in files:
            ctl.load(file)

        if not files:
            ctl.load("-")

        ctl.ground([("base", [])])
        ctl.solve()

    def print_model(self, model, printer):
        print(f"Answer: {model.number}")
        print(Sudoku.from_model(model))

if __name__ == "__main__":
    clingo_main(ClingoApp(sys.argv[0]), sys.argv[1:])