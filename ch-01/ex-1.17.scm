(define (* a b)
  (print a)
  (if (= b 0)
      0
      (+ a (* a (- b 1)))))
