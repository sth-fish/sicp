(define (pow b n)
  (if (= n 0)
      1
      (* b (pow b (- n 1)))))
