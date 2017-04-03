(define (a-plus-abs-b a b)
	(if (> b 0) + -) a b) ; если (> b 0) верно, то (+ a b), иначе (- a b)