GHCi, version 7.6.3: http://www.haskell.org/ghc/  :? for help
Loading package ghc-prim ... linking ... done.
Loading package integer-gmp ... linking ... done.
Loading package base ... linking ... done.
Prelude> :load "/home/julia/Dropbox/programmering/hej.hs"
[1 of 1] Compiling Main             ( /home/julia/Dropbox/programmering/hej.hs, interpreted )

/home/julia/Dropbox/programmering/hej.hs:11:27:
    Ambiguous occurrence `reverse'
    It could refer to either `Main.reverse',
                             defined at /home/julia/Dropbox/programmering/hej.hs:10:1
                          or `Prelude.reverse',
                             imported from `Prelude' at /home/julia/Dropbox/programmering/hej.hs:1:1
                             (and originally defined in `GHC.List')
Failed, modules loaded: none.
Prelude> klistra "f" "e"

<interactive>:3:1: Not in scope: `klistra'
Prelude> klistra ["f"]  ["e"]

<interactive>:4:1: Not in scope: `klistra'
Prelude> :load "/home/julia/Dropbox/programmering/hej.hs"
[1 of 1] Compiling Main             ( /home/julia/Dropbox/programmering/hej.hs, interpreted )

/home/julia/Dropbox/programmering/hej.hs:11:27:
    Ambiguous occurrence `reverse'
    It could refer to either `Main.reverse',
                             defined at /home/julia/Dropbox/programmering/hej.hs:10:1
                          or `Prelude.reverse',
                             imported from `Prelude' at /home/julia/Dropbox/programmering/hej.hs:1:1
                             (and originally defined in `GHC.List')
Failed, modules loaded: none.
Prelude> :load "/home/julia/Dropbox/programmering/hej.hs"
[1 of 1] Compiling Main             ( /home/julia/Dropbox/programmering/hej.hs, interpreted )

/home/julia/Dropbox/programmering/hej.hs:11:27:
    Ambiguous occurrence `reverse'
    It could refer to either `Main.reverse',
                             defined at /home/julia/Dropbox/programmering/hej.hs:10:1
                          or `Prelude.reverse',
                             imported from `Prelude' at /home/julia/Dropbox/programmering/hej.hs:1:1
                             (and originally defined in `GHC.List')
Failed, modules loaded: none.
Prelude> :load "/home/julia/Dropbox/programmering/hej.hs"
[1 of 1] Compiling Main             ( /home/julia/Dropbox/programmering/hej.hs, interpreted )

/home/julia/Dropbox/programmering/hej.hs:11:1:
    parse error on input `reverse'
Failed, modules loaded: none.
Prelude> :load "/home/julia/Dropbox/programmering/hej.hs"
[1 of 1] Compiling Main             ( /home/julia/Dropbox/programmering/hej.hs, interpreted )

/home/julia/Dropbox/programmering/hej.hs:10:1:
    parse error on input `reverse'
Failed, modules loaded: none.
Prelude> :load "/home/julia/Dropbox/programmering/hej.hs"
[1 of 1] Compiling Main             ( /home/julia/Dropbox/programmering/hej.hs, interpreted )

/home/julia/Dropbox/programmering/hej.hs:10:1:
    parse error on input `reverse'
Failed, modules loaded: none.
Prelude> reverse[]
[]
Prelude> reverse 5:4

<interactive>:11:9:
    No instance for (Num [a0]) arising from the literal `5'
    Possible fix: add an instance declaration for (Num [a0])
    In the first argument of `reverse', namely `5'
    In the first argument of `(:)', namely `reverse 5'
    In the expression: reverse 5 : 4

<interactive>:11:11:
    No instance for (Num [[a0]]) arising from the literal `4'
    Possible fix: add an instance declaration for (Num [[a0]])
    In the second argument of `(:)', namely `4'
    In the expression: reverse 5 : 4
    In an equation for `it': it = reverse 5 : 4
Prelude> reverse [5,4]
[4,5]
Prelude> reverse[1,2,3,4,5,6,7,8,9,0]
[0,9,8,7,6,5,4,3,2,1]
Prelude> klistra [45] [89]

<interactive>:14:1: Not in scope: `klistra'
Prelude> reverse[1,2,3,4,5,6,7,8,9,0]
[0,9,8,7,6,5,4,3,2,1]
Prelude> 