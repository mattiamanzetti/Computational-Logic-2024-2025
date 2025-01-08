(push) 
(declare-fun B (Int Int ) Bool)

(assert (and
            (B 2 8)                 (B 5 8)        (B 7 8)       
            (B 2 7) (B 3 7)
                                    (B 5 6) (B 6 6)        (B 8 6)
    (B 1 5)         (B 3 5)         (B 5 5) 
    (B 1 4)         (B 3 4)                                (B 8 4)
                            (B 5 4) (B 5 3)                (B 8 3)    
            (B 2 2) (B 3 2)         (B 5 2)     
                                                   (B 7 1)
    )
)


(define-fun TRANS ((x Int) (y Int) (v1 Bool) (v2 Bool) (xp Int) (yp Int) (v1p Bool) (v2p Bool) ) Bool
      (and
        (<= 1 xp) (<= xp 8) (<= 1 yp) (<= yp 8) 
        (or 
         (and (= xp x) (= yp y))
         (and (= (abs (- xp x)) 1) (= yp y))
         (and (= (abs (- yp y)) 1) (= xp x))         
        )
       (not (B xp yp))
       (ite (and (= xp 1) (= yp 1)) (= v1p true) (= v1p v1)) 
       (ite (and (= xp 6) (= yp 3)) (= v2p true) (= v2p v2)) 
      ) 
)      

(define-fun PRE ((x Int) (y Int) (v1 Bool) (v2 Bool)) Bool
       (and (= x 1) (= y 8) (= v1 false) (= v2 false))
       )
       
(define-fun POST ((x Int) (y Int) (v1 Bool) (v2 Bool)) Bool
       (and (= x 8) (= y 1) (= v1 true) (= v2 true))
       )
       
(declare-const x0 Int)
(declare-const y0 Int)
(declare-const v10 Bool)
(declare-const v20 Bool)

(declare-const x1 Int)
(declare-const y1 Int)
(declare-const v11 Bool)
(declare-const v21 Bool)

(declare-const x2 Int)
(declare-const y2 Int)
(declare-const v12 Bool)
(declare-const v22 Bool)

(declare-const x3 Int)
(declare-const y3 Int)
(declare-const v13 Bool)
(declare-const v23 Bool)

(declare-const x4 Int)
(declare-const y4 Int)
(declare-const v14 Bool)
(declare-const v24 Bool)

(declare-const x5 Int)
(declare-const y5 Int)
(declare-const v15 Bool)
(declare-const v25 Bool)

(declare-const x6 Int)
(declare-const y6 Int)
(declare-const v16 Bool)
(declare-const v26 Bool)

(declare-const x7 Int)
(declare-const y7 Int)
(declare-const v17 Bool)
(declare-const v27 Bool)

(declare-const x8 Int)
(declare-const y8 Int)
(declare-const v18 Bool)
(declare-const v28 Bool)

(declare-const x9 Int)
(declare-const y9 Int)
(declare-const v19 Bool)
(declare-const v29 Bool)

(declare-const x10 Int)
(declare-const y10 Int)
(declare-const v110 Bool)
(declare-const v210 Bool)

(declare-const x11 Int)
(declare-const y11 Int)
(declare-const v111 Bool)
(declare-const v211 Bool)

(declare-const x12 Int)
(declare-const y12 Int)
(declare-const v112 Bool)
(declare-const v212 Bool)

(declare-const x13 Int)
(declare-const y13 Int)
(declare-const v113 Bool)
(declare-const v213 Bool)

(declare-const x14 Int)
(declare-const y14 Int)
(declare-const v114 Bool)
(declare-const v214 Bool)

(declare-const x15 Int)
(declare-const y15 Int)
(declare-const v115 Bool)
(declare-const v215 Bool)

(declare-const x16 Int)
(declare-const y16 Int)
(declare-const v116 Bool)
(declare-const v216 Bool)

(declare-const x17 Int)
(declare-const y17 Int)
(declare-const v117 Bool)
(declare-const v217 Bool)

(declare-const x18 Int)
(declare-const y18 Int)
(declare-const v118 Bool)
(declare-const v218 Bool)

(declare-const x19 Int)
(declare-const y19 Int)
(declare-const v119 Bool)
(declare-const v219 Bool)

(declare-const x20 Int)
(declare-const y20 Int)
(declare-const v120 Bool)
(declare-const v220 Bool)

(assert (PRE x0 y0 v10 v20))
(assert (TRANS x0 y0 v10 v20 x1 y1 v11 v21))
(assert (TRANS x1 y1 v11 v21 x2 y2 v12 v22))
(assert (TRANS x2 y2 v12 v22 x3 y3 v13 v23))
(assert (TRANS x3 y3 v13 v23 x4 y4 v14 v24))
(assert (TRANS x4 y4 v14 v24 x5 y5 v15 v25))
(assert (TRANS x5 y5 v15 v25 x6 y6 v16 v26))
(assert (TRANS x6 y6 v16 v26 x7 y7 v17 v27))
(assert (TRANS x7 y7 v17 v27 x8 y8 v18 v28))
(assert (TRANS x8 y8 v18 v28 x9 y9 v19 v29))
(assert (TRANS x9 y9 v19 v29 x10 y10 v110 v210))
(assert (TRANS x10 y10 v110 v210 x11 y11 v111 v211))
(assert (TRANS x11 y11 v111 v211 x12 y12 v112 v212))
(assert (TRANS x12 y12 v112 v212 x13 y13 v113 v213))
(assert (TRANS x13 y13 v113 v213 x14 y14 v114 v214))
(assert (TRANS x14 y14 v114 v214 x15 y15 v115 v215))
(assert (TRANS x15 y15 v115 v215 x16 y16 v116 v216))
(assert (TRANS x16 y16 v116 v216 x17 y17 v117 v217))
(assert (TRANS x17 y17 v117 v217 x18 y18 v118 v218))
(assert (TRANS x18 y18 v118 v218 x19 y19 v119 v219))
(assert (TRANS x19 y19 v119 v219 x20 y20 v120 v220))
(assert (POST x20 y20 v120 v220))

(check-sat)
(echo " ")
(get-value (x0 y0))
(echo " ")
(get-value (x1 y1))
(echo " ")
(get-value (x2 y2))
(echo " ")
(get-value (x3 y3))
(echo " ")
(get-value (x4 y4))
(echo " ")
(get-value (x5 y5))
(echo " ")
(get-value (x6 y6))
(echo " ")
(get-value (x7 y7))
(echo " ")
(get-value (x8 y8))
(echo " ")
(get-value (x9 y9))
(echo " ")
(get-value (x10 y10))
(echo " ")
(get-value (x11 y11))
(echo " ")
(get-value (x12 y12))
(echo " ")
(get-value (x13 y13))
(echo " ")
(get-value (x14 y14))
(echo " ")
(get-value (x15 y15))
(echo " ")
(get-value (x16 y16))
(echo " ")
(get-value (x17 y17))
(echo " ")
(get-value (x18 y18))
(echo " ")
(get-value (x19 y19))
(echo " ")
(get-value (x20 y20))
(pop)





(push)
;; Define the absolute value function
(define-fun absval ((x Int)) Int
  (ite (< x 0) (- x) x))

;; Define the initial state predicate
(define-fun PRE ((x Int) (y Int) (v1 Bool) (v2 Bool)) Bool
  (and
    ;; Initial position (1,1)
    (= x 1) (= y 1)
    ;; All elements in array v are set to false
    (= v1 false)
    (= v2 false)))

;; Define the goal state predicate
(define-fun POST ((x Int) (y Int) (v1 Bool) (v2 Bool)) Bool
  (and
    ;; Target position (8,8)
    (= x 8) (= y 8)
    ;; Both c1 and c2 in array v are set to true
    (= v1 true)
    (= v2 true)))

;; Define the transition relation
(define-fun TRANS ((x Int) (y Int) (xp Int) (yp Int) (v1 Bool) (v2 Bool) (v1p Bool) (v2p Bool)) Bool
  (and
    ;; Ensure the new position (xp, yp) is within bounds
    (<= 1 xp) (<= xp 8)
    (<= 1 yp) (<= yp 8)
    ;; Define obstacles that cannot be occupied
    (not (or
      (and (= xp 1) (= yp 4))
      (and (= xp 1) (= yp 5))
      (and (= xp 2) (= yp 1))
      (and (= xp 2) (= yp 2))
      (and (= xp 2) (= yp 7))
      (and (= xp 3) (= yp 2))
      (and (= xp 3) (= yp 4))
      (and (= xp 3) (= yp 5))
      (and (= xp 3) (= yp 7))
      (and (= xp 4) (= yp 6))
      (and (= xp 5) (= yp 1))
      (and (= xp 5) (= yp 3))
      (and (= xp 5) (= yp 4))
      (and (= xp 5) (= yp 6))
      (and (= xp 5) (= yp 7))
      (and (= xp 6) (= yp 3))
      (and (= xp 6) (= yp 5))
      (and (= xp 6) (= yp 7))
      (and (= xp 7) (= yp 1))
      (and (= xp 7) (= yp 8))
      (and (= xp 8) (= yp 3))
      (and (= xp 8) (= yp 5))
      (and (= xp 8) (= yp 6)))
    )
    ;; Allow movements to adjacent cells (horizontal or vertical)
    (or
      (and (= (absval (- xp x)) 1) (= (absval (- yp y)) 0))
      (and (= (absval (- xp x)) 0) (= (absval (- yp y)) 1))
      (and (= xp x) (= yp y))
    )
    ;; Update the array v based on specific positions
    (ite (and (= xp 1) (= yp 8)) (= v1p true) (= v1p v1)) 
    (ite (and (= xp 6) (= yp 6)) (= v2p true) (= v2p v2)) 
))

(declare-const x0 Int)
(declare-const y0 Int)
(declare-const v10 Bool)
(declare-const v20 Bool)

(declare-const x1 Int)
(declare-const y1 Int)
(declare-const v11 Bool)
(declare-const v21 Bool)

(declare-const x2 Int)
(declare-const y2 Int)
(declare-const v12 Bool)
(declare-const v22 Bool)

(declare-const x3 Int)
(declare-const y3 Int)
(declare-const v13 Bool)
(declare-const v23 Bool)

(declare-const x4 Int)
(declare-const y4 Int)
(declare-const v14 Bool)
(declare-const v24 Bool)

(declare-const x5 Int)
(declare-const y5 Int)
(declare-const v15 Bool)
(declare-const v25 Bool)

(declare-const x6 Int)
(declare-const y6 Int)
(declare-const v16 Bool)
(declare-const v26 Bool)

(declare-const x7 Int)
(declare-const y7 Int)
(declare-const v17 Bool)
(declare-const v27 Bool)

(declare-const x8 Int)
(declare-const y8 Int)
(declare-const v18 Bool)
(declare-const v28 Bool)

(declare-const x9 Int)
(declare-const y9 Int)
(declare-const v19 Bool)
(declare-const v29 Bool)

(declare-const x10 Int)
(declare-const y10 Int)
(declare-const v110 Bool)
(declare-const v210 Bool)

(declare-const x11 Int)
(declare-const y11 Int)
(declare-const v111 Bool)
(declare-const v211 Bool)

(declare-const x12 Int)
(declare-const y12 Int)
(declare-const v112 Bool)
(declare-const v212 Bool)

(declare-const x13 Int)
(declare-const y13 Int)
(declare-const v113 Bool)
(declare-const v213 Bool)

(declare-const x14 Int)
(declare-const y14 Int)
(declare-const v114 Bool)
(declare-const v214 Bool)

(declare-const x15 Int)
(declare-const y15 Int)
(declare-const v115 Bool)
(declare-const v215 Bool)

(declare-const x16 Int)
(declare-const y16 Int)
(declare-const v116 Bool)
(declare-const v216 Bool)

(declare-const x17 Int)
(declare-const y17 Int)
(declare-const v117 Bool)
(declare-const v217 Bool)

(declare-const x18 Int)
(declare-const y18 Int)
(declare-const v118 Bool)
(declare-const v218 Bool)

(declare-const x19 Int)
(declare-const y19 Int)
(declare-const v119 Bool)
(declare-const v219 Bool)

(declare-const x20 Int)
(declare-const y20 Int)
(declare-const v120 Bool)
(declare-const v220 Bool)

(assert (PRE x0 y0 v10 v20))
(assert (TRANS x0 y0 x1 y1 v10 v11 v20 v21))
(assert (TRANS x1 y1 x2 y2 v11 v12 v21 v22))
(assert (TRANS x2 y2 x3 y3 v12 v13 v22 v23))
(assert (TRANS x3 y3 x4 y4 v13 v14 v23 v24))
(assert (TRANS x4 y4 x5 y5 v14 v15 v24 v25))
(assert (TRANS x5 y5 x6 y6 v15 v16 v25 v26))
(assert (TRANS x6 y6 x7 y7 v16 v17 v26 v27))
(assert (TRANS x7 y7 x8 y8 v17 v18 v27 v28))
(assert (TRANS x8 y8 x9 y9 v18 v19 v28 v29))
(assert (TRANS x9 y9 x10 y10 v19 v110 v29 v210))
(assert (TRANS x10 y10 x11 y11 v110 v111 v210 v211))
(assert (TRANS x11 y11 x12 y12 v111 v112 v211 v212))
(assert (TRANS x12 y12 x13 y13 v112 v113 v212 v213))
(assert (TRANS x13 y13 x14 y14 v113 v114 v213 v214))
(assert (TRANS x14 y14 x15 y15 v114 v115 v214 v215))
(assert (TRANS x15 y15 x16 y16 v115 v116 v215 v216))
(assert (TRANS x16 y16 x17 y17 v116 v117 v216 v217))
(assert (TRANS x17 y17 x18 y18 v117 v118 v217 v218))
(assert (TRANS x18 y18 x19 y19 v118 v119 v218 v219))
(assert (TRANS x19 y19 x20 y20 v119 v120 v219 v220))
(assert (POST x20 y20 v120 v220))

(check-sat)
(echo " ")
(get-value (x0 y0))
(echo " ")
(get-value (x1 y1))
(echo " ")
(get-value (x2 y2))
(echo " ")
(get-value (x3 y3))
(echo " ")
(get-value (x4 y4))
(echo " ")
(get-value (x5 y5))
(echo " ")
(get-value (x6 y6))
(echo " ")
(get-value (x7 y7))
(echo " ")
(get-value (x8 y8))
(echo " ")
(get-value (x9 y9))
(echo " ")
(get-value (x10 y10))
(echo " ")
(get-value (x11 y11))
(echo " ")
(get-value (x12 y12))
(echo " ")
(get-value (x13 y13))
(echo " ")
(get-value (x14 y14))
(echo " ")
(get-value (x15 y15))
(echo " ")
(get-value (x16 y16))
(echo " ")
(get-value (x17 y17))
(echo " ")
(get-value (x18 y18))
(echo " ")
(get-value (x19 y19))
(echo " ")
(get-value (x20 y20))
(pop)