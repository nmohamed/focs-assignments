#lang racket

(define (tree-add1 tree)
	(newline)(display tree)(newline)

; check if first is list. 
; is not, so return x + 1. then create list combining (x+1) and (rest tree). 
; if it is a list, do tree-add (first list)
	(if (list? (first tree))
		; then
		(if (empty? first tree)
			; then
			'()
			; else
			(cons 
				(+ (first tree) 1)
				(cons (rest tree) '())
			)
		)
		; else
		(tree-add1 (first tree))
	)
	; (map (lambda (num) (
	; 	(display "***")(display num)(newline)
	; 	(if (list? num )
	; 		; then
	; 		((display "recursion\n")(tree-add1 num))
	; 		; else
	; 		((display "+1num\n")(+ 1 num))
	; 	)
	; ) ) tree)
)

; 1
; check if list. if not list, return x + 1
; '()
; check if list. if list, check if list is empty, return empty list
; '(1)
; check if first is list. if not list, return x+1
; '(1 (2 3))
; check if first is list. is not, so return x + 1. then create list combining (x+1) and (rest tree). if it is a list, do tree-add (first list)

(display (tree-add1 '(3 (1 4)) ) )