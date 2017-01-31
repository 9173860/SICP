; In Louis’s flatmap chunk above, to place the 8th queen, the expression (queen-cols 7), which returns the collection of all boards with 7 queens safely placed, is evaluated 8 times while the corresponding steps in Exercise 2.42 only have the expression (queen-cols 7) evaluated once.

; So in the evaluation of (queens 8), (queen-col 8) is called once in both versions, (queen-col 7) is called once in the first procedure and 7 times in Louis’s procedure, (queen-col 6) called once in the first procedure and 7 x 6 = 42 times in Louis’s, and so on.

; Therefore, if the first procedure solves the n queens puzzle in time TT, we would expect Louis’s procedure to solve it in O((n−1)!)TO((n−1)!)T. We run some timings:

; Reference: http://mngu2382.github.io/sicp/chapter2/01-exercise10.html

(define (queens1 board-size)
    (define (queen-cols k)
        (if (= k 0)
            (list empty-board)
            (filter
             (lambda (positions) (safe? k positions))
             (flatmap
              (lambda (new-row)
                  (map (lambda (rest-of-queens)
                           (adjoin-position new-row
                                            k
                                            rest-of-queens))
                       (queen-cols (- k 1))))
              (enumerate-interval 1 board-size)))))
    (queen-cols board-size))
    
(define (time-queens proc n)
    (let ((start (runtime)))
         (proc n)
         (proc n)
         (proc n)
         (display (/ (- (runtime) start) 3))))