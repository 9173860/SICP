(define (make-vect xcor ycor)
  (list xcor ycor))

(define (xcor-vect vect)
  (car vect))
(define (ycor-vect vect)
  (cadr vect))

(define (add-vect v1 v2)
  (make-vect (+ (xcor-vect v1) (xcor-vect v2))
             (+ (ycor-vect v1) (ycor-vect v2))))

(define (sub-vect v1 v2)
  (make-vect (- (xcor-vect v1) (xcor-vect v2))
             (- (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect scale vect)
  (make-vect (* (xcor-vect vect) scale)
             (* (ycor-vect vect) scale)))