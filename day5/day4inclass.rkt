#lang racket

(define (list-length-helper lst res)
	(if (empty? lst)
		res
		(list-length-helper (rest lst) (+ res 1))
	)
)

(define (list-length lst)
	(list-length-helper lst 0)
)

(display "\nlist-length: ") (display (list-length '(1 2) ))

; -------

(define (count-evens-helper lst res)
	(if (empty? lst)
		res
		(count-evens-helper (rest lst) 
			(if (even? (first lst))
				(+ res 1)
				res
			)
		)
	)
)

(define (count-evens lst)
	(count-evens-helper lst 0)
)

(define (count-evens-filter lst)
	(list-length (filter even? lst))
)

(display "\ncount-evens NO FILTER: ") (display (count-evens '(1 2 4) ))
(display "\ncount-evens YES FILTER: ") (display (count-evens-filter '(1 2 4) ))

; ----------------------------

(define (list-square lst)
	(map (lambda (x)
			(* x x)
		)
		lst)
)

(display "\nlist-square: ") (display (list-square '(1 2 4) ))

; -------------------------

(define (list-add1 lst n)
	(map (lambda (x)
			(+ x n)
		)
		lst)
)

(display "\nlist-addn: ") (display (list-add1 '(1 2 4) 10 ))

; -------------------------

(define (filter-even lst)
	(filter even? lst)
)

(display "\nfilter-even: ") (display (filter-even '(1 2 4) ))

; ------------------------

(define (filter-positive lst)
	(filter positive? lst)
)

(display "\nfilter-positive: ") (display (filter-positive '(-1 -10 1 2 4) ))

; ------------------------

(define (filter-gt lst lower)
	(define (gt-n? num)
  		(if (>= num lower)
  			#t
  			#f
  		)
  	)
  	(filter gt-n? lst)
)

(display "\nfilter-gt: ") (display (filter-gt '(-1 -10 1 2 4) 1))


; 10. the only one that doesn't use map/filter is #1. 
; This is because you're not returning a list, but instead
; a number. #2 has you return a number too but you can use 
; filter to make the list you look at not include numbers
; you don't want.

(car (quote '(5 8 10)))