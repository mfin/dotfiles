#!/bin/env python3
"""colorblocks.py - output random colored blocks 

Usage: 
    colorblocks.py [-m MIN] [-M MAX] [-g GAP] [-c CH] [-s]

Options:
    -m MIN, --min MIN   Set the min width of a block 
                        [default: 4]
    -M MAX, --max MAX   Set the max width of a block 
                        [default: 10]
    -g GAP, --gap GAP   Set the probability of a block being a gap 
                        [default: 0.3]
    -c CH, --char CH    Set the character that composes a block. 
                        [default:  ]
    -s, --same          Make all blocks within a row have the same color

"""
from docopt import docopt
import random
import subprocess

echo = lambda s: print(s, end="")
rand_fg = lambda: random.choice(range(31,38))

class canvas():
    def __init__(self):
        self.size = map(int, subprocess.check_output(['stty','size']).split())
    def __enter__(self):
        echo('\033[?25l') 
        return self.size
    def __exit__(self, type, value, traceback):
        subprocess.call('tput reset'.split())
        return True

def distribute(min, max, total):
    """
    generate a list of numbers between `min` and `max` that adds up to `total`
    """
    if total < max:
        return [total]
    block = random.choice(range(min, max+1))
    return [block] + distribute(min, max, total-block )

if __name__ == '__main__':
    args = {k[2:]:v for k,v in docopt(__doc__).items()}
    min,max,gap = int(args['min']),int(args['max']), float(args['gap'])
    same, char = args['same'],args['char']

    if min > max:
        raise ValueError('min must be less than max')

    with canvas() as (rows, cols): 
        for row in range(rows):
            row_color = rand_fg()
            for size in distribute(min, max, cols):
                colored = gap <= random.random()
                color = (row_color if same else rand_fg()) if colored else 49
                char = char if colored else " "
                if colored and char == " ":
                    color+=10 
                echo("\033[{}m{}".format(color, char * size))
        input()
