(declare-datatypes () ((C r1c1 r1c2 r1c3 r2c1 r2c2 r2c3))) ; the cells: row(x)-column(y)

(declare-fun adjacent0 (C C) Bool)
(declare-fun adjacent (C C) Bool)

(assert (forall ((x C) (y C)) (= (adjacent0 x y) (or 
          ; horizontal 
          (and (= x r1c1) (= y r1c2))
          (and (= x r1c2) (= y r1c3))
          (and (= x r2c1) (= y r2c2))
          (and (= x r2c2) (= y r2c3))
          ; vertical
          (and (= x r1c1) (= y r2c1))
          (and (= x r1c2) (= y r2c2))
          (and (= x r1c3) (= y r2c3))
))))

; symmetrization
(assert (forall ((x C) (y C)) (= (adjacent x y)
           (or (adjacent0 x y) (adjacent0 y x)
           )))
)


; SWAP exchange the content of I and J in A
(define-fun SWAP ( (A (Array C Int)) (I C)  (J C) ) (Array C Int)
     (store (store A J (select A I)) I (select A J))
)

(define-fun TRANS ( (A (Array C Int)) (Ap (Array C Int))) Bool
           (or (= Ap A)
             (exists ((x C) (y C))
                (and 
                   (or (= (select A x) 0) (= (select A y) 0))
                   (adjacent x y)
                   (= Ap (SWAP A y x))
                 )
             )  
            )
)

;  |1|2|3|
;  |4|5| |

(define-fun POST ((A (Array C Int))) Bool
      (and (= (select A r1c1) 1) 
           (= (select A r1c2) 2)
           (= (select A r1c3) 3)
           (= (select A r2c1) 4)
           (= (select A r2c2) 5) 
           (= (select A r2c3) 0)
       )
)

;  |4|1|3|
;  |2|5| |

(define-fun PRE ((A (Array C Int))) Bool
      (and (= (select A r1c1) 4) 
           (= (select A r1c2) 1)
           (= (select A r1c3) 3)
           (= (select A r2c1) 2)
           (= (select A r2c2) 5) 
           (= (select A r2c3) 0)
       )
)

(declare-const A0 (Array C Int))
(declare-const A1 (Array C Int)) 
(declare-const A2 (Array C Int)) 
(declare-const A3 (Array C Int)) 
(declare-const A4 (Array C Int)) 
(declare-const A5 (Array C Int)) 
(declare-const A6 (Array C Int)) 

(assert (PRE A0))
(assert (TRANS A0 A1))
(assert (TRANS A1 A2))
(assert (TRANS A2 A3))
(assert (TRANS A3 A4))
(assert (TRANS A4 A5))
(assert (TRANS A5 A6))
(push)
(assert (POST A5))
(check-sat)
(pop)
(assert (POST A6))
(check-sat)

(get-value ((select A0 r1c1) (select A0 r1c2) (select A0 r1c3) (select A0 r2c1) (select A0 r2c2) (select A0 r2c3)))
(echo "")
(get-value ((select A1 r1c1) (select A1 r1c2) (select A1 r1c3) (select A1 r2c1) (select A1 r2c2) (select A1 r2c3)))
(echo "")
(get-value ((select A2 r1c1) (select A2 r1c2) (select A2 r1c3) (select A2 r2c1) (select A2 r2c2) (select A2 r2c3)))
(echo "")
(get-value ((select A3 r1c1) (select A3 r1c2) (select A3 r1c3) (select A3 r2c1) (select A3 r2c2) (select A3 r2c3)))
(echo "")
(get-value ((select A4 r1c1) (select A4 r1c2) (select A4 r1c3) (select A4 r2c1) (select A4 r2c2) (select A4 r2c3)))
(echo "")
(get-value ((select A5 r1c1) (select A5 r1c2) (select A5 r1c3) (select A5 r2c1) (select A5 r2c2) (select A5 r2c3)))
(echo "")
(get-value ((select A6 r1c1) (select A6 r1c2) (select A6 r1c3) (select A6 r2c1) (select A6 r2c2) (select A6 r2c3)))
(echo "")









