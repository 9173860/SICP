(load "23.scm") ; for-each
(load "48.scm") ; segment operations
(load "frame-coord-map.scm")

(define (draw-line x y)
  (display "draw line: ")
  (display (list x y))
  (newline))

(define (segments->painter segment-list)
  (lambda (frame)
    (for-each
      (lambda (segment)
        (draw-line
          ((frame-coord-map frame) (start-segment segment))
          ((frame-coord-map frame) (end-segment segment))))
    segment-list)))