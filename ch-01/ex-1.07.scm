; (sqrt (square 0.01))
; => 0.03230844833048122
; Test fails because absolute tolerance of 0.001 is too large
; when computing sqrt of small numbers.

; (sqrt 10000000000000)
; For really large numbers evaluation never terminates due to limited precision

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? guess x)
  (< (abs (- (improve guess x) guess))
     (abs (* guess 0.001))))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))
