(load "accumulate.scm")
(load "enumerate-interval")
(load "filter.scm")
(load "flatmap.scm")

; n is the maximum value in triple
; s is the sum of triple
(define (unique-triple n)
  (flatmap (lambda (i) 
            (flatmap (lambda (j) 
                  (map (lambda (k) (list i j k))
                       (enumerate-interval 1 (- j 1))))
                  (enumerate-interval 1 (- i 1))))
            (enumerate-interval 1 n)))

(define (certain-sum s seq)
  (eq? (accumulate + 0 seq) s)
)

(define (sum-three n s)
  (filter (lambda (seq) (certain-sum s seq)) (unique-triple n)))