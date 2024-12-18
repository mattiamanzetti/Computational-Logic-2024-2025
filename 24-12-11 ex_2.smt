; Use z3 to find the path in the following labyrinth from the entry point (marked ⇓) to the exit point (marked ⇒)

(define-fun absval ((x Int)) Int (ite (< x 0) (- x) x))
(define-fun INITIAL ((x Int) (y Int)) Bool (and (= x 1) (= y 1)))
(define-fun FINAL ((x Int) (y Int)) Bool (and (= x 8) (= y 8)))
(define-fun TRANSISTOR
            ((x Int) (y Int) (xp Int) (yp Int)) Bool
            (and 
                (<= xp 1) (<= yp 1) (<= xp 8) (<= yp 8)
                (not (and (= xp 2) (= yp 1)))
                (not (and (= xp 5) (= yp 1)))
                (not (and (= xp 7) (= yp 1)))
                (not (and (= xp 2) (= yp 2)))
                (not (and (= xp 3) (= yp 2)))
                (not (and (= xp 5) (= yp 3)))
                (not (and (= xp 6) (= yp 3)))
                (not (and (= xp 8) (= yp 3)))
                (not (and (= xp 1) (= yp 4)))
                (not (and (= xp 3) (= yp 4)))
                (not (and (= xp 5) (= yp 4)))
                (not (and (= xp 1) (= yp 5)))
                (not (and (= xp 3) (= yp 5)))
                (not (and (= xp 6) (= yp 5)))
                (not (and (= xp 8) (= yp 5)))
                (not (and (= xp 4) (= yp 6)))
                (not (and (= xp 5) (= yp 6)))
                (not (and (= xp 8) (= yp 6)))
                (not (and (= xp 2) (= yp 7)))
                (not (and (= xp 3) (= yp 7)))
                (not (and (= xp 5) (= yp 7)))
                (not (and (= xp 6) (= yp 7)))
                (not (and (= xp 7) (= yp 8)))
                (or 
                    (and (= xp x) (= (absval (- yp y)) 1)) ; xp = x, |yp - y| = 1
                    (and (= yp y) (= (absval (- xp x)) 1)) ; yp = y, |xp - x| = 1
                    ; (and (= yp y) (= xp x) 
                )
            )  
)

(declare-const x0 Int)
(declare-const y0 Int)
(declare-const x1 Int)
(declare-const y1 Int)
(declare-const x2 Int)
(declare-const y2 Int)
(declare-const x3 Int)
(declare-const y3 Int)
(declare-const x4 Int)
(declare-const y4 Int)
(declare-const x5 Int)
(declare-const y5 Int)
(declare-const x6 Int)
(declare-const y6 Int)
(declare-const x7 Int)
(declare-const y7 Int)
(declare-const x8 Int)
(declare-const y8 Int)
(declare-const x9 Int)
(declare-const y9 Int)
(declare-const x10 Int)
(declare-const y10 Int)
(declare-const x11 Int)
(declare-const y11 Int)
(declare-const x12 Int)
(declare-const y12 Int)
(declare-const x13 Int)
(declare-const y13 Int)
(declare-const x14 Int)
(declare-const y14 Int)
(declare-const x15 Int)
(declare-const y15 Int)
(declare-const x16 Int)
(declare-const y16 Int)

(assert (INITIAL x0 y0)) 
(assert (TRANSISTOR x0 y0 x1 y1))
(assert (TRANSISTOR x1 y1 x2 y2))
(assert (TRANSISTOR x2 y2 x3 y3))
(assert (TRANSISTOR x3 y3 x4 y4))
(assert (TRANSISTOR x4 y4 x5 y5))
(assert (TRANSISTOR x5 y5 x6 y6))
(assert (TRANSISTOR x6 y6 x7 y7))
(assert (TRANSISTOR x7 y7 x8 y8))
(assert (TRANSISTOR x8 y8 x9 y9))
(assert (TRANSISTOR x9 y9 x10 y10))
(assert (TRANSISTOR x10 y10 x11 y11))
(assert (TRANSISTOR x11 y11 x12 y12))
(assert (TRANSISTOR x12 y12 x13 y13))
(assert (TRANSISTOR x13 y13 x14 y14))
(assert (TRANSISTOR x14 y14 x15 y15))
(assert (TRANSISTOR x15 y15 x16 y16))
(assert (FINAL x16 y16))

(check-sat)