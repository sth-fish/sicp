;;; Process generated by the pow procedure in evaluating (pow 2 20)

;;; (pow 2 20)

;;; (iter 1 0)
;;; (iter 2 1)
;;; (iter 4 2)
;;; (iter 8 3)
;;; (iter 16 4)
;;; (iter 32 5)
;;; (iter 64 6)
;;; (iter 128 7)
;;; (iter 256 8)
;;; (iter 512 9)
;;; (iter 1024 10)
;;; (iter 2048 11)
;;; (iter 4096 12)
;;; (iter 8192 13)
;;; (iter 16384 14)
;;; (iter 32768 15)
;;; (iter 65536 16)
;;; (iter 131072 17)
;;; (iter 262144 18)
;;; (iter 524288 19)
;;; (iter 1048576 20)

;;; 1048576

(define (pow b n)
  (define (iter product count)
    (if (= count n)
      product
      (iter
        (* b product)
        (+ count 1))))
  (iter 1 0))
