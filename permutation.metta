
; permutation and its concepts
(= (factorial' 0) 1)
(= (factorial' $n) 
   (if (> $n 0)
       (* $n (factorial' (- $n 1)))
       (Error "Factorial undefined for negative numbers" BadInput)
   )
)

; length of a list
(= (length $list)
   (if (== $list ())
       0
       (let* (
              (($h $t) (decons-atom $list))
             )
             (+ 1 (length $t))
       )
   )
)

;; number of permutations
(= (no_of_permute $list $r)
   (/ (factorial' (length $list)) (factorial' (- (length $list) 3)))
)

;; remove function recursively
(= (remove $x $list)
   (if (== $list ())
       ()
       (let* (
              ($head (car-atom $list))
              ($tail (cdr-atom $list))
              ($rest (remove $x $tail))  
             )
             (if (== $head $x)
                 $rest
                 (cons-atom $head $rest)
             )
       )
   )
)
; permute function that shows all the permutes
(= (permute $list $r)
   (if (== $r 0)
       ()
       (if (== $r 1)
           (collapse
              (let $x (superpose $list)
                 ($x)
              )
           )
           (collapse
              (let* (
                     ($x (superpose $list))
                     ($rest (remove $x $list))
                     ($smaller (permute $rest (- $r 1)))
                    )
                    (let $y (superpose $smaller)
                       (cons-atom $x $y)
                    )
              )
           )
       )
   )
)
; Test cases
!(permute (1 2 3) 2)
!(permute (1 2 3 4 5) 3)