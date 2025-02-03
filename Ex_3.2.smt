




(declare-datatypes () ((I a b c d)))
(declare-fun Thief (I) Bool)  ; to be the thief

(assert (exists ((x I)) (Thief x)))
(assert ((_ at-most 1) (Thief a) (Thief b) (Thief c) (Thief d)))

(declare-fun Knight (I) Bool)  ; to be a knight, ie to tell the truth
(declare-fun Knave (I) Bool)  ; to be a knave, ie to lie
(assert (forall ((x I)) (= (Knight x) (not (Knave x)))))
(assert ((_ at-most 1) (Knave a) (Knave b) (Knave c) (Knave d)))

; Alice and Carlo say they are not guilty, 
; Bruno says that Alice or Davide is guilty, 
; while Davide says that Alice is lying.

(assert (= (Knight a) (not (Thief a))))
(assert (= (Knight c) (not (Thief c))))
(assert (= (Knight b) (or (Thief a) (Thief d))))
(assert (= (Knight c) (Knave a)))

(check-sat)
(get-value ((Thief a) (Thief b) (Thief c) (Thief d)))

;uniqueness of solution
(assert (not (Thief a)))
(check-sat)

