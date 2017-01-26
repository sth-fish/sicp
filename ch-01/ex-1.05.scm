; Applicative-order evaluation: evaluation never terminates, because evaluation of (p) goes into infinite loop:
; (test 0 (p))
; (test 0 (p))
; (test 0 (p))

; Normal-order evaluation: terminates, prints 0:
; (test 0 (p))
; (if (= 0 0) 0 (p)))
; (if (#t) 0 (p))
; => 0

(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))
    
(test 0 (p))
