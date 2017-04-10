(define (square x) (* x x))

(define (abs x)
	(cond ((< x 0) (- x))
		(else x)))


(define (sqrt-iter guess x)
	(if (good-enough? guess x)
		guess
		(sqrt-iter (improve guess x)
			x)))

(define (improve guess x)
	(average guess (/ x guess)))

(define (average x y)
	(/ (+ x y) 2))

(define (good-enough? guess x)
	(< (abs (- (square guess) x)) 0.001))

(define (sqrt x)
	(sqrt-iter 1.0 x))

	
;;; Определяем новый if
(define (new-if predicate then-clause else-clause)
	(cond (predicate then-clause)
		(else else-clause)))
	
;;; С новым if происходит зацикливание (ошибка: maximum recursion depth exceeded)
;;; Это происходит из-за аппликативного порядка вычисления, те вычисляем, в случае 
;;; с new-if, predicate, then-clause, else-clause и только затем саму процедуру new-if
(define (sqrt-iter-v2 guess x)
	(new-if (good-enough? guess x)
		guess
		(sqrt-iter-v2 (improve guess x)
			x)))
			
(define (sqrt-v2 x)
	(sqrt-iter-v2 1.0 x))
	
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; Версия с cond будет работать
(define (sqrt-iter-cond guess x)
	(cond ((good-enough? guess x) guess)
		(else (sqrt-iter-cond (improve guess x)
			x))))
			
(define (sqrt-cond x)
	(sqrt-iter-cond 1.0 x))





