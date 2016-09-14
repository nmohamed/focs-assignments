#lang racket

;;; Student Name: Nora Mohamed
;;;
;;; Check one:
;;; [ ] I completed this assignment without assistance or external resources.
;;; [x] I completed this assignment using these external resources: racket documentation

;;     NOTE:  You need not worry about error checking in the programs below.

;; 1.  WRITE SQUARE:  given n, returns n^2.  Hint:  use *
(define (square x)
  (* x x)
)
  
(display (square 2)) (newline)  ;; -> 4

;; 2.  WRITE is-right-triangle:  given three numbers, returns true iff the third
;;     could be the hypotenuse of a right triangle with the specified three side lengths
;;     Hint:  use = to compare numeric values

(define (is-right-triangle a b c)
  (if ( = (+ (* a a) (* b b)) (* c c) ) ; a^2 + b^2 = c^2
  		"true" ;then
  		"false" ;else
  )
)
  
(display "****") (newline)
(display (is-right-triangle 3 4 5)) (newline)  ;; -> #t
(display (is-right-triangle 4 5 6)) (newline)  ;; -> #f

;; 3.  WRITE FACTORIAL:  given n, returns n!
;;     Hint:  recursion is your friend
(define (fact n)
  (if (= n 0) 
  	1 ; then
  	(* n (fact (- n 1)) ) ; else
  )
 )

(display "****") (newline)
(display (fact 1)) (newline) ;; -> 1
(display (fact 2)) (newline) ;; -> 2
(display (fact 3)) (newline) ;; -> 6

;; 4.  WRITE FIBONACCI:  given n, returns the nth fibonacci number as shown below
;;     Hint:  don't run this on really big numbers!
(define (fib n)
   (if (or (= n 1) (= n 2))
   	1
   	(+ (fib (- n 1)) (fib (- n 2)) )
   )
)

(display "****") (newline)
(display (fib 1)) (newline) ;; -> 1
(display (fib 2)) (newline) ;; -> 1
(display (fib 3)) (newline) ;; -> 2
(display (fib 4)) (newline) ;; -> 3
(display (fib 5)) (newline) ;; -> 5
(display (fib 6)) (newline) ;; -> 8

;; 5.  WRITE a procedure that takes a list of numbers and returns the sum of those numbers
;;     Hint:  first, rest, cons
(define (sum lst)
  (apply + lst)
)
  ; (if (empty? (rest lst))
  ; 	 0
  ; 	(+ (first lst) (sum (rest lst)) )
  ; )

(display "****") (newline)
(display (sum '(1 2 3 4))) (newline) ;; -> 10
(display (sum '(1 20 300))) (newline) ;; -> 321

;; 6.  WRITE a procedure that takes a list of numbers and returns the largest one.
;;     While there are solutions using scheme's built-in max, we were actually hoping you'd do something else...
(define (my-max lst)
  (if (equal? (list (first lst)) lst ) ; first check if last element
  	(first lst)
	(if (= (first lst) (second lst))
		(my-max (remove (first lst) lst)) ; if equal just remove one
		(if (< (first lst) (second lst)) ; else check which is larger
	  		(my-max (remove (first lst) lst)) ; if first < second
	  		(my-max (remove (second lst) lst)) ; if first > second
	  )
	)

  )
)

(display "****") (newline)
(display (my-max '(1 10 2 20 3))) (newline) ;; -> 20
