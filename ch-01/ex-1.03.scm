(define (max-two-sum-of-squares x y z)
  (define max-1 (max x y))
  (define min-1 (min x y))
  (define max-2 (max z min-1))
  (sum-of-squares max-1 max-2))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define(square x) (* x x))
