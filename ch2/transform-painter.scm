(load "46.scm")  ; vector operations
(load "47.scm")  ; frame operations
(load "frame-coord-map")
(define (transform-painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (painter
        (make-frame new-origin
                    (sub-vect (m corner1) new-origin)
                    (sub-vect (m corner2) new-origin))))))