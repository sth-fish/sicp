(define (fib n)
  (define (fib-iter a b n)
    (if (= n 0)
	b
	(fib-iter (+ a b) a (- n 1))))
  (fib-iter 1 0 n))
