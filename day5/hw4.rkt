#lang racket

;;; Student Name: Nora Mohamed
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment with assistance from racket docs

; note: excuse the syntax, I was using sublime but sublime doesn't have read, so I switched to DrRacket and now everything looks wierd

; helpers
(define (my-zip-help firstList secondList result)
	(if (or (empty? firstList) (empty? secondList))
		result
		(my-zip-help (rest firstList) (rest secondList) (append (list (list (first firstList) (first secondList)) ) result) )
	)
)

(define (my-zip firstList secondList)
	(my-zip-help firstList secondList '() ))

(define (list-length-helper lst res)
  (if (list? lst)
	(if (empty? lst)
		res
		(list-length-helper (rest lst) (+ res 1))
	)
        0
  )
)
(define (list-length lst) (list-length-helper lst 0))

; run!
(define (run-repl init-list)
  (display "welcome to my repl.  type some scheme-ish")
  (repl init-list))

(define (repl init-list)
  (display "> ")
  (display (evaluate (read) init-list))
  (newline)
  (repl init-list))

(define (evaluate lst init-list)
  (cond   ; if given a symbol do lookup-list
        [(and (symbol? lst) (not (list? lst)))
               (lookup-list lst init-list)
        ] ; define a symbol
        [ (and (list? lst) (eq? (first lst) 'DEFINE))
               ( repl
                 (append
                      (list (list (second lst) (evaluate-helper (third lst) init-list)))
                       init-list
                 ))
        ] ; if given lambda statement to define, not evaluate
        [ (and (list? lst) (eq? (first lst) 'LAMBDA))
               (list 'LAMBDA (second lst) (third lst))
        ]; otherwise evaluate
        [else (evaluate-helper lst init-list)]
      )
)

; initial association list
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

; possible operations that could be applied by default
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

        [else -1] ; operator not found
  )
)

; does math
(define (evaluate-helper lst init-list)
	(if (list? lst)
  		; then
            (cond [(eq? (first lst) 'NOT) (not (evaluate-helper (lookup-list (second lst) init-list) init-list) )]
                  [(eq? (first lst) 'IPH) (if (evaluate-helper (lookup-list (second lst) init-list) init-list)
	  				(evaluate-helper (lookup-list (third lst) init-list) init-list)
	  				(evaluate-helper (lookup-list (fourth lst) init-list) init-list))]
                  [(>= (list-length (first lst)) 3 ) ; means it's lambda since max possibilities are (lambda params func lookup-list) where lookup-list is optional. lookup list is only there if lambda was DEFINEd earlier
                        (do-lambda lst) ; format of ( (LAMBDA (a b) (ADD a b)) 1 2)
                  ]
                  [(eq? (first lst) 'LAMBDA) ; if you provide lambda to define/just state a func
                        (list 'LAMBDA (second lst) (third lst))
                  ] ; if it's a lambda function defined as some symbol
                  [(eq? (lookup-list (first lst) operator-list) (first lst)) ; if symbol is not an operator
                        ; if (test 1 2) -> ((LAMBDA params func) 1 2)
                        (do-lambda (append (list (lookup-list (first lst) init-list)) (rest lst) ))
                  ] ; otherwise just evaluate
                  [else (apply-op (first lst)
                        (evaluate-helper (lookup-list (second lst) init-list) init-list)
                        (evaluate-helper (lookup-list(third lst) init-list) init-list)
	  			)]
            )
            ; else return final
            lst
  	)
)

(define (do-lambda lst)
  (evaluate-helper (third (first lst))
       (my-zip (second (first lst)) (rest lst)) ; new lookup list
  )
)

; checks if symbol has an associated value
(define (lookup-list item lst)
	(if (empty? lst)
		; then return what was given
		item
		; else check lst elements
		(if (eq? item (first (first lst)))
			; then
			(second (first lst))
			; else
                        (lookup-list item (rest lst))
		)
	)
)

; ( (LAMBDA (a b) (ADD a b))  1 2  )
(list-length 1)

;;;;;;;;;;;;;;;;;;;;;;
(run-repl operator-list)

; problems when:
; you define a symbol as another symbol
; you can't do (DEFINE a 10) -> (test a 2)

; test with these lines:
; >(LAMBDA (a b) (ADD a b))
; (LAMBDA (a b) (ADD a b))
; >((LAMBDA (a b) (ADD a b)) 1 2)
; 3
; >(DEFINE test (LAMBDA (a b) (ADD a b)))
; >(test 1 2)
; 3