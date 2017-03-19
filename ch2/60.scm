(define (adjoin-set x set) (cons x set))
(define (union-set set1 set2) (append set1 set2))

; element-of-set? and intersection-set would be the
; same as unsorted set.
;
; We would get O(1) in adjoin-set and union-set
; operation, but element-of-set? and intersection-set
; would take more time.
;
; If we need lots of adjoin or union operation rather
; than find element or intersection, we would use
; repeatable representation of set.