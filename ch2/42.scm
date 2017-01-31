(load "accumulate.scm")
(load "enumerate-interval")
(load "filter.scm")
(load "flatmap.scm")

; we use a list of pairs to represented board here, first element in
; the pair is column and second is row
; so a board like ((1 1) (2 3) (3 5) (4 7) (5 2) (6 4) (7 6) (8 8))
; would be a board as following:
; *  0  0  0  0  0  0  0
; 0  0  0  0  *  0  0  0
; 0  *  0  0  0  0  0  0
; 0  0  0  0  0  *  0  0
; 0  0  *  0  0  0  0  0
; 0  0  0  0  0  0  *  0
; 0  0  0  *  0  0  0  0
; 0  0  0  0  0  0  0  *

(define (not-eq? a b) (not (eq? a b)))

(define (nth n l)
  (if (or (> n (length l)) (< n 0))
    (error "Index out of bounds.")
    (if (eq? n 0)
      (car l)
      (nth (- n 1) (cdr l)))))

(define (safe? k positions)
  (let ((k-pos (cadr (nth (- k 1) positions))))
    (accumulate (lambda (a b) (cond (a b) (else #f))) ; "and" is keyword, this is an replacement
                #t
                (map (lambda (pair)
                        (if (eq? k (car pair))
                          #t
                          (and (not-eq? k-pos (cadr pair)) ; should not in same row
                              (not-eq? k-pos (+ (cadr pair) (- (length positions) (car pair)))) ; upper cross
                              (not-eq? k-pos (- (cadr pair) (- (length positions) (car pair))))))) ; lower cross
                      positions))))

(define empty-board '())

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list (list k new-row)))
)

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
          (lambda (positions) (safe? k positions))
          (flatmap
            (lambda (rest-of-queens)
              (map (lambda (new-row)
                      (adjoin-position new-row k rest-of-queens))
                    (enumerate-interval 1 board-size)))
            (queen-cols (- k 1))))))
    (queen-cols board-size))