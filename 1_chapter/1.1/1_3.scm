(define (square x) (* x x))

(define (sum-of-squares x y)
	(+ (square x) (square y)))

(define (two-big-squares a b c)
	(if (or (> a b) (> a c))
		(if (> b c)
			(sum-of-squares a b)
			(sum-of-squares a c))
		(sum-of-squares b c)))