; path finding algorithm in metta
(= (routes) (AddisAbaba Adama))
(= (routes) (Adama AddisAbaba))
(= (routes) (Adama BahirDar))
(= (routes) (BahirDar AddisAbaba))
(= (routes) (DireDawa AddisAbaba))
(= (routes) (Adama DireDawa))
(= (routes) (Ambo Mekelle))
(= (routes) (Gonder Hawassa))


(= (pathFind $start $via $dest)
   (collapse 
      (let* (
             (($start $via) (superpose ((routes))))
             (($via $dest) (superpose ((routes))))
            )
            ($start $via $dest)
      )
   )
)

; Test cases
!(pathFind AddisAbaba Adama DireDawa)
!(pathFind AddisAbaba $v DireDawa)
!(pathFind oromia Adama BahirDar)
