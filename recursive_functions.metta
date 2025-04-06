; Zip function in metta using recursion
(= (zip $list1 $list2)
   (case ($list1 $list2)
         (((() ()) ())
          ((($x $xs) ($y $ys)) (($x $y) (zip $xs $ys)))
          ($else ERROR)
         )
   )
)

; Test cases
! (zip (A (B ())) (1 (2 ()))) 

;; ZipWith function in metta using recursion
(= (zipWith $f $list1 $list2)
   (case ($list1 $list2)
         (((() ()) ())                    ; Base case: both empty
          ((($x $xs) ($y $ys)) (($f $x $y) (zipWith $f $xs $ys)))  ; Apply f, recurse
          ($else ERROR)                  ; Unequal lengths
         )
   )
)

; Define a sample function for testing (e.g., addition)
(= (add $x $y) (+ $x $y))

; Test cases
!(zipWith add (1 (2 ())) (3 (4 ())))

;; Repeat function in metta using recursion
(= (repeat $x $n)
   (case (== $n 0)         ; Compare $n to 0 explicitly
         ((True ())            ; Base case: n = 0
          (False ($x (repeat $x (- $n 1))))  ; Recursive case: n > 0
         )
   )
)

; Test cases
!(repeat A 4)

; generate function in metta using recursion
(= (generate $start $end)
    (if (>= $start $end)
        ()
        ($start (generate (+ $start 1) $end))
    )
)
!(generate 1 10)