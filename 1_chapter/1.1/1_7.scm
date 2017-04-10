(define (abs x)
	(cond ((< x 0) (- x))
		(else x)))


(define (sqrt-iter guess x)
	(if (new-good-enough? guess x)
		guess
		(sqrt-iter (improve guess x)
			x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (new-good-enough? guess x)
	(< (abs (- guess (improve guess x))) 0.00001))

(define (sqrt x)
	(sqrt-iter 1.0 x))