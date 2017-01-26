; if combination returns either + or - procedure, which is then applied to arguments
; when - is returned and applied to negative `b`, the sign will be inverted
; (+ a |b|)

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))
