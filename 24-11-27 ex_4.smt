; COMMENT: this specification file includes the possibility of flipping the tiles before inserting them into the solution frame. 
; Since the text of the exercise was (deliberately) a bit vague, other specifications (without flips, with selected flips, etc.) will be considered correct.
; Such different specifications  can of course give different solutions 

(declare-datatypes () ((T t1 t2 t3 t4 t5 t6 t7 t8 t9 t10)))

(declare-fun Left ((T)) Int)
(declare-fun Right ((T)) Int)

(declare-fun F ((T)) Bool) ; this function says whether we flip the tile before inserting in the solution
(declare-fun Position ((T)) Int) ; this function gives the solution
(declare-fun FLeft ((T)) Int)  ; left cell after possible flip
(declare-fun FRight ((T)) Int) ; right cell after possible flip


; Tile' positions range from 1 to 10
(assert (forall ((x T)) (and (< 0 (Position x)) (<= (Position x) 10)))) 
; Injectivity requirement: different tiles have different positions 
(assert (forall ((x T) (y T)) (=> (= (Position x) (Position y)) (= x y))))

; If tile x is flipped, (Left x) and (Right x) are swapped
(assert (forall ((x T))(=> (not (F x)) (and (= (FLeft x) (Left x)) (= (FRight x) (Right x))))))    
(assert (forall ((x T))(=> (F x) (and (= (FLeft x) (Right x)) (= (FRight x) (Left x))))))
       
; Matching requirement
(assert (forall ((x T) (y T)) (=> (= (Position x) (+ (Position y) 1)) (= (FRight y) (FLeft x))))) 
; We need an extra matching requirement to close the circle
(assert (forall ((x T) (y T)) (=> (and (= (Position x) 1) (= (Position y) 10)) (= (FRight y) (FLeft x)))))

(assert (and
          (= (Left t1) 1) (= (Right t1) 3)
          (= (Left t2) 6) (= (Right t2) 1)
          (= (Left t3) 3) (= (Right t3) 2)
          (= (Left t4) 9) (= (Right t4) 6)
          (= (Left t5) 1) (= (Right t5) 2)
          (= (Left t6) 4) (= (Right t6) 9)
          (= (Left t7) 2) (= (Right t7) 6)
          (= (Left t8) 2) (= (Right t8) 4)
          (= (Left t9) 6) (= (Right t9) 1)
          (= (Left t10) 2) (= (Right t10) 2)
          )
)

(check-sat) 
(get-value ((Position t1) (FLeft t1) (FRight t1)))
(get-value ((Position t2) (FLeft t2) (FRight t2)))
(get-value ((Position t3) (FLeft t3) (FRight t3)))
(get-value ((Position t4) (FLeft t4) (FRight t4)))
(get-value ((Position t5) (FLeft t5) (FRight t5)))
(get-value ((Position t6) (FLeft t6) (FRight t6)))
(get-value ((Position t7) (FLeft t7) (FRight t7)))
(get-value ((Position t8) (FLeft t8) (FRight t8)))
(get-value ((Position t9) (FLeft t9) (FRight t9)))
(get-value ((Position t10) (FLeft t10) (FRight t10)))
