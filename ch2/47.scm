(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (caddr frame))

(define (make-frame1 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define origin-frame1 origin-frame)
(define edge1-frame1 edge1-frame)
(define (edge2-frame1 frame)
  (cddr frame))