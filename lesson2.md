#The Haskell calculator: ghci

In lesson 1 we used https://tryhaskell.org/ but now it is time to use Haskell also off-line, on your computer.

#But first some repetition

In lesson 1 we talked about expressions, values, types, lists, definitions, and functions. I had intended to also talk more about evaluation and "wishful thinking" but we'll do that today instead.

##Values and expressions

The core of Haskell is the expression language. Some parts are well known from mathematics: 3+4, 5/8, (17+3)*(2 + 1), etc.
When you type in an expression the TryHaskell system computes (and prints) its "value".
Each expression can be viewed as a "tree" (called the syntax tree):

         *
        / \
       /   \
      +     +
     / \   / \
    17  3  2  1

Computer scientists like to draw "trees" upside-down starting with the root (here *), branching out downwards in smaller "sub-trees" and ening up in "leaves" (here 17, 3, 2, and 1).

## Evaluation (computing values from expressions)

"Evaluation" means to compute the value of an expression (a syntax tree). For our example the steps are

         *
        / \
       /   \
      20    +
           / \
           2  1

then

         *
        / \
       /   \
      20    3

and finally

    60

Almost all of Haskell follows this same idea. This means that quite some of your mathematical training is very helful in learning programming. And the opposite is also true: by learning programming in Haskell you will improve your understanding of mathematics!

#Important new concepts: Programs, computers and compilers

* a program is a precise description of something you want the computer to compute(;-)
    * a program can have several forms: source code, machine code, etc.
    * source code is a human-readable (text) form of a program
    * machine code is a CPU-readable (binary) form of a program
* a CPU (Central Processing Unit) is the core of a computer
    * the CPU can only run programs in binary "machine code" form (unreadable for humans)
* a compiler is a translator from source code to (some form of) machine code

(More to be filled in)

#The principle of "Wishful thinking"

When solving problems it is very often convenient to use the principle
of "wishful thinking": when solving P, try to come up with simpler
problems Q, R and S which (when solved) make P easy to solve. Then
just describe the solution of P in terms of the solutions of Q, R, and
S. If done right this reduces the complexity of the top level problem
quite a bit. When the top level is done the next step is to solve the
smaller problems. We often need to split (some of) them up too and so
on. (It also happens that we fail and have to try again from the
start, but then one has usually learned something along the way which
helps in splitting the problem up in a different way.)

As an example take P = sorting a list. Then an example could be
* Q = split the list into smaller parts (call them left and right)
* R = sort the left and right parts
* S = merge the two (now sorted) parts into a sorted final result.

In Haskell a "problem" is often just the type of a function. And a
solution is some (well-behaved) function of that type.

#Time for software installation

[Installing the Haskell Platform](http://www.haskell.org/platform/) is
a bit different depending on the operating system on your computer:
* [Ubuntu](haskellonubuntu.md)
* [Windows](haskellonwindows.md)

Some instructions are available here:
* https://sites.google.com/site/graphicalhaskell/lesson-1-getting-started

##The Haskell Platform

https://www.haskell.org/platform/

##An editor

I use [emacs](http://www.gnu.org/software/emacs/) but it might be easier to start with
* Windows: [Notepad++](http://notepad-plus-plus.org/)
* Linux: [gedit](http://en.wikipedia.org/wiki/Gedit)
* MacOS: ?

##A terminal

