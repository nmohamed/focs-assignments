#lang racket

(define (list-length lst)
	(if (null? lst)
		0
		(+ 1 (list-length (rest lst)))
	)
)


(define (member? elt lst)
	(cond [(null? lst)
				#f]
		  [(equal? elt (first lst))
		  		#t]
		  [(not (equal? elt (first lst)) )
		  		(member? elt (rest lst))]
	)
)

(define (list-length-2 lst)
	(ll lst 0)
	)

(define (ll lst so-far)
	(if (null? lst)
		so-far
		(ll (rest lst) (+ 1 so-far))
		)
)


(define (fact n)
  (if (= n 0) 
  	1 ; then
  	(* n (fact (- n 1)) ) ; else
  )
 )

(display "factorial: ") (display (fact 3)) (newline)

(define (fact-tail-helper n currentVal)
  (if (= n 0) 
  	currentVal ; then
  	(fact-tail-helper (- n 1) (* currentVal n) ) ; else
  )
 )

(define (fact-tail n)
	(fact-tail-helper (- n 1) n)
)

(display "t-factorial: ") (display (fact-tail 3))

; -------------

(define (teen? x) (and (<= 13 x) (>= 19 x)))

(define (apply-op arg num)
	(cond [(eq? arg even?) (even? num)]
		  [(eq? arg teen?) (teen? num)]
		  [(eq? arg double) (double num)]
		  [(eq? arg incr) (incr num)]
		))

(define (do-my-filter arg lst result)

	(if (empty? lst)
		result
		(if (apply-op arg (first lst)) 
			(do-my-filter arg (rest lst) (append (list (first lst)) result))
			(do-my-filter arg (rest lst) result)
		)
	)
)

(define (my-filter arg lst)
	(do-my-filter arg lst '() )
)

(display "\nfilter even: ") (my-filter even? '(1 2 3 4 5 6)) ; --> '(2 4 6)
(display "\nfilter teen: ") (my-filter teen? '(21 17 2 14 11)) ; --> '(17 14)

(define (my-map-HELP arg lst result)
	(if (empty? lst)
		result
		(my-map-HELP arg (rest lst) (append result (list (apply-op arg (first lst)) ) ))
	)
)

(define (my-map arg lst)
	(my-map-HELP arg lst '() ))

(define (double x)
	(* 2 x))
(define (incr x)
	(+ x 1))

(display "\ndouble:") (my-map double '(1 2 3))
(display "\nincr:") (my-map incr '(1 2 3))

(define (my-append-help firstList secondList)
	(if (empty? firstList) 
		secondList
		(my-append-help (rest firstList) (cons (first firstList) secondList) )
	)
)

(define (my-append firstList secondList)
	(my-append-help (reverse firstList) secondList)
)

(display "\nappend:") (my-append '(1 2 3) '(4 5 6) )


(define (my-zip-help firstList secondList result)
	(if (or (empty? firstList) (empty? secondList))
		result
		(my-zip-help (rest firstList) (rest secondList) (my-append (list (list (first firstList) (first secondList)) ) result) )
	)
)

(define (my-zip firstList secondList)
	(my-zip-help firstList secondList '() ))

(display "\nzip:") (my-zip '(1 2 3) '(a b c) )


(define (my-reverse-helper oldList newList)
	(if (empty? oldList)
		newList
		(my-reverse-helper (rest oldList) (append (list (first oldList)) newList))
	)
)


(define (my-reverse lst)
	(my-reverse-helper lst '())
)

(display "\nreverse:") (my-reverse '(1 2 3))