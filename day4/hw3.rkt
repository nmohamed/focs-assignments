#lang racket

;;; Student Name: Nora Mohamed
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from racket docs

;;;;;;;;;;;
;; 1. assq

;; `assq` is a function that takes a key and an association list.
;;
;; It returns the corresponding key/value pair from the list
;; (*i.e.*, the pair whose key is *eq?* to the one it is given).
;;
;; If the key is not found in the list, `assq` returns `#f`.


(define operator-list
	(list (list 'ADD +)
	    (list 'SUB -)
	    (list 'MUL *)
	    (list 'DIV /)
	    (list 'GT >)
	    (list 'LT <)
	    (list 'GE >=)
	    (list 'LE <=)
	    (list 'EQ =)
	    (list 'NEQ (lambda (x y) (not (= x y))))
	    (list 'ANND (lambda (x y) (and x y)))
	    (list 'ORR (lambda (x y) (or x y)))
	    (list 'NOTT not)
	)
)

(define (my-assq item lst)
	(if (empty? lst)
		; then return false
		#f
		; else check lst elements
		(if (eq? item (first (first lst)))
			; then
			(first lst)
			; else
			(my-assq item (rest lst))
		)
	)
)

(my-assq 'ADD operator-list) ; --> '(ADD #<procedure:+>)
(my-assq 'ANND operator-list) ; --> '(ANND #<procedure>)
(my-assq 'FOO operator-list) ; --> #f


;;;;;;;;;;;
;; 2. lookup-list

;; Add the ability to look up symbols to your evaluator.
;;
;; Add the `lookup-list` argument to your hw2 evaluator (or ours, from the solution set).
;; `(evaluate 'foo lookup-list)` should return whatever `'foo` is associated with in `lookup-list`.

(define (apply-op op arg1 arg2)
  (cond [(eq? op 'ADD) (+ arg1 arg2)] ; return values
        [(eq? op 'SUB) (- arg1 arg2)]
        [(eq? op 'MUL) (* arg1 arg2)]
        [(eq? op 'DIV) (/ arg1 arg2)]

        [(eq? op 'LT) (< arg1 arg2)] ; return boolean
  			[(eq? op 'GT) (> arg1 arg2)]
        [(eq? op 'LE) (<= arg1 arg2)]
        [(eq? op 'GE) (>= arg1 arg2)]
        [(eq? op 'EQ) (eq? arg1 arg2)]
        [(eq? op 'NEQ) (not (eq? arg1 arg2))]

        [(eq? op 'AND) (and arg1 arg2)] ; return boolean
        [(eq? op 'OR) (or arg1 arg2)]

        [else (error "Invalid:" op)]
  )
)

(define (evaluate lst lookup)
	(if (list? lst)
  		; then
  		(if (eq? (first lst) 'NOT) ; check for special cases of NOT
  			(not (evaluate (second lst) lookup) )
	  		(if (eq? (first lst) 'IPH) ; check for special case of IPH
	  			(if (evaluate (second lst) lookup)
	  				(evaluate(third lst) lookup)
	  				(evaluate(fourth lst) lookup)
	  			)
	  			(apply-op (first lst)
	  				  		(evaluate (second lst) lookup)
	  				  		(evaluate (third lst) lookup)
	  			)
	  		)
	  	)
  		; else check to see if second arg is a lookup list
  		; lst
  		(if (eq? lookup 'NIL)
  			; then
  			lst
  			; else
  			(lookup-list lst lookup)
  		)
  	)
)

(define (lookup-list item lst)
	(if (empty? lst)
		; then return false
		#f
		; else check lst elements
		(if (eq? item (first (first lst)))
			; then
			(second (first lst))
			; else
			(my-assq item (rest lst))
		)
	)
)

; if you want to search for an element
(display "\neval a lookup list:") (evaluate 'ADD operator-list)
; if you want to do math
(display "eval some normal math:") (evaluate '(ADD 3 4) 'NIL)