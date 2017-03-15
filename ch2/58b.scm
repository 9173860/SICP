(define (simplify exp)
  (if (null? (cdr exp)) (car exp) exp))

(define (augend s) (simplify (cddr s)))
(define (multiplicand p) (simplify (cddr p)))