(define (abs x)
	(cond ((< x 0) (- x))
		(else x)))

(define (square x) (* x x))
		
(define (third-root-iter guess x)
	(if (good-enough? guess x)
		guess
		(third-root-iter (improve guess x)
			x)))

(define (improve guess x)
	(average (* 2 guess) (/ x (square guess))))

(define (average x y)
	(/ (+ x y) 3))

(define (good-enough? guess x)
	(< (abs (- guess (improve guess x))) 0.00001))

(define (third-root x)
	(third-root-iter 1.0 x))