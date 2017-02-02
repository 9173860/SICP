(define (split first-action second-action)
  (define (inner-split painter n)
    (if (= n 0)
        painter
        (let ((smaller (inner-split painter (- n 1))))
          (first-action painter (second-action smaller smaller)))))
   inner-split)