(list 'a 'b 'c)
; Value: (a b c)

(list (list 'george))
; Value: ((george))

(cdr '((x1 x2) (y1 y2)))
; Value: ((y1 y2))
; Note: cdr on a list would have a bracket wrapped

(pair? (car '(a short list)))
; Value: #f
; Note: result would not depend on value of a
;      because a is just a symbol and won't
;      be evaluated

(memq 'red '((red shoes) (blue socks))) 
; Value: #f

(memq 'red '(red shoes blue socks))
; Value: (red shoes blue socks)
