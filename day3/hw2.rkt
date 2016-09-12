#lang racket

;;; Student Name: Nora Mohamed
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment using these external resources: racket docs

;;; 1.  Create a calculator that takes one argument: a list that represents an expression.
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
  )
)

(define (calculate lst)
	(if (list? lst)
  		; then
  		(if (eq? (first lst) 'NOT) ; check for special cases of NOT
  			(not (calculate (second lst)) )
	  		(if (eq? (first lst) 'IPH) ; check for special case of IPH
	  			(if (calculate (second lst))
	  				(calculate(third lst))
	  				(calculate(fourth lst))
	  			)
	  			(apply-op (first lst)
	  				  		(calculate (second lst))
	  				  		(calculate (third lst))
	  			)
	  		)
	  	)
  		; else
  		(#%app + 0 lst) ; it really wants a procedure here...
  		)
)

; take first argument. apply it to second and third.
; if second and/or third are lists, take first argument of list and appl.
; 

(calculate '(ADD 3 4)) ;; --> 7

;;; 2. Expand the calculator's operation to allow for arguments that are themselves well-formed arithmetic expressions.

(calculate '(ADD 3 (MUL 4 5))) ;; --> 23   ;; what is the equivalent construction using list?
(calculate '(SUB (ADD 3 4) (MUL 5 6))) ;; --> -23

;;; 3. Add comparators returning booleans (*e.g.*, greater than, less than, …).
;; Note that each of these takes numeric arguments (or expressions that evaluate to produce numeric values),
;; but returns a boolean.  We suggest operators `GT`, `LT`, `GE`, `LE`, `EQ`, `NEQ`.

(calculate '(GT (ADD 3 4) (MUL 5 6))) ;; --> #f
(calculate '(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))) ;; --> #t

;;; 4. Add boolean operations AND, OR, NOT

(calculate '(AND 
							(GT (ADD 3 4) (MUL 5 6))
							(LE (ADD 3 (MUL 4 5)) (SUB 0 (SUB (ADD 3 4) (MUL 5 6))))
						)
) ;; --> #f
(calculate '(NOT (GT (ADD 3 4) (MUL 5 6)) ) ) ; --> #t

; ;;; 5. Add IPH
(calculate '(GT (ADD 3 4) 7))
(calculate '(IPH (GT (ADD 3 4) 7) (ADD 1 2) (ADD 1 3))) ;; -> 4
