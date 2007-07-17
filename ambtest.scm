(define fail
    (lambda ()
      (amb)))

(define member?
    (lambda (i lst)
      (if (null? lst)
	  ()
	  (if (= (car lst) i)
	      t
	      (member? i (cdr lst))))))

(define all-different
    (lambda (l)
      (if (null? l)
	  t
	  (if (member? (car l) (cdr l))
	      ()
	      (all-different (cdr l))))))

((lambda (a b c d)
   (begin
    (if (all-different (cons a (cons b (cons c (cons d ())))))
	()
	(fail))
    ((lambda (ab bc cd)
       (if (= (+ ab bc) cd)
	   (cons ab (cons bc (cons cd ())))
	   (fail)))
     (+ (* a 10) b)
     (+ (* b 10) c)
     (+ (* c 10) d))))
 (amb 0 1 2 3 4 5 6 7 8 9)
 (amb 0 1 2 3 4 5 6 7 8 9)
 (amb 0 1 2 3 4 5 6 7 8 9)
 (amb 0 1 2 3 4 5 6 7 8 9))

(define non-zero-digit
    (lambda ()
      (amb 1 2 3 4 5 6 7 8 9)))

(define digit
    (lambda ()
      (amb 0 (non-zero-digit))))

((lambda (s e n d m o r y)
   (begin
    (if (all-different (cons s (cons e (cons n (cons d (cons m (cons o (cons r (cons y ())))))))))
	()
	(fail))
    ((lambda (send more money)
       (if (= (+ send more) money)
	   (cons send (cons more (cons money ())))
	   (fail)))
     (+ (* s 1000) (* e 100) (* n 10) d)
     (+ (* m 1000) (* o 100) (* r 10) e)
     (+ (* m 10000) (* o 1000) (* n 100) (* e 10) y))))
 (non-zero-digit) (digit) (digit) (digit)
 (non-zero-digit) (digit) (digit) (digit))
