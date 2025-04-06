;; isMemeber Implementation in non-deterministic way
(= (isMember $x $atom)
   (collapse 
             (let $a (superpose $atom)
                  (if (== $a $x) True (empty))
             )
           ) 
)

!(isMember 2 (1 2 3))
!(isMember 4 (1 2 3))


;; find and remove Implemenation in non-deterministic way
(= (findAndRemove $exp $target)
   (collapse 
      (let $a (superpose $exp)  ; Remove parentheses around ($exp)
         (if (== $a $target)
             (empty)             
             $a
         )
      )
   )
)

; Test cases
!(findAndRemove (1 2 3) 1)

;; find and replace Implemenation in non-deterministic way
(= (FindAndReplace $exp $target $replacement)
    (collapse 
        (let $a (superpose $exp)
            (if (== $a $target)
                $replacement
                $a
            )
        ))
)

; Test cases
!(FindAndReplace (1 2 3) 1 4)
