#Welcome!

For this first meeting we will use 
  https://tryhaskell.org/
to explore simple expressions in the programming language Haskell.

We will start with the tutorial.

#Values and types

First a few words about values and types.

In Haskell every "value" (like 3, "Hello", [1,7,3,8], True) has a "type" (like Integer, String, [Integer], Bool).

Computer languages in general are very picky about the exact characters used and you will certainly receive quite a few error messages when you try out even simple expressions. This "pickyness" is nothing to worry about and is intended as a help to the user (the programmer). In the beginning the error messages can be quite difficult to understand, but hopefully that will improve over time.

The very first examples at tryhaskell.com are
  23 * 36
and
  reverse "hello"

In the first part of the lesson I want you to try out some examples using the tryhaskell.com web site.

# Values and expressions

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

# Evaluation (computing values from expressions)

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

#Name and reuse

To compute more complex expressions it is possible (and recommended) to name and reuse expressions. An example

The first example in TryHaskell.com is

    let  x = 4   in    x * x

(which evaluates to 16).

Let's take this apart:

| Part | Explanation
| ---- | ----
| let      | marks the start of a named expression (called "a declaration")
| x = 4    | is the declaration that x can now be used instead of 4
| in       | marks the start of the expression part
| x * x    | is an expression using the new name  

In this case writing 4 * 4 directly would have been shorter, but if x is big we start to gain:

    let  r = 1738   in   pi*r^2

Note that the name can also help to explain what is going on (can you guess)?

#Functions

The "name and reuse" idea is really at the core of computing and we can reuse not only simple expressions but also functions.

    let   area r = pi*r^2   in  (area 2) / (area 1)

Here we have defined a function called area which given any value r will compute the area of a circle of radius r.

    let   area r = pi*r^2   in  map area [1,2..10]

We can also combine naming functions and values

    let   area r = pi*r^2   in  let areas = map area [1,2..10]   in   map round areas


#Whishful thinking

(To be written;-)

#The Haskell calculator: ghci

We have used tryhaskell.org for now, but as homework for next time please install haskell-platform which gives you access to Haskell also off-line.

(More to be filled in)

