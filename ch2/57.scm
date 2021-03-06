(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))
(define (append s) (cadr s))
(define (augend s)
  (if (eq? (length (cddr s)) 1)
    (caddr s)
    (cons '+ (cddr s))))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))
(define (multiplier s) (cadr s))
(define (multiplicand s)
  (if (eq? (length (cddr s)) 1)
    (caddr s)
    (cons '* (cddr s))))