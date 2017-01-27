(define (sum-of-max-two-squares x y z)
  (if (> x y)
      (sum-of-squares x (max y z))
      (sum-of-squares y (max x z))))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define(square x) (* x x))
