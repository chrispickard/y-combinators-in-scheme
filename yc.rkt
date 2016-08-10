#lang scheme

;define fact-maker
; (lambda (procedure)
;   (lambda (n)
;     (if (zero? n)
;         1
;         (* n ((procedure procedure) (- n 1)))))))

;((fact-maker fact-maker) 5)


;(define F
;((lambda (func-arg)
;(lambda (n)
;(if (zero? n)
;1
;(* n (func-arg (- n 1))))))
;(lambda (arg) ((procedure procedure) arg))))
;
(define F*
  (lambda (func-arg)
    (lambda (n)
      (if (zero? n)
          1
          (* n (func-arg (- n 1)))))))

;(((lambda (procedure) F)
;(lambda (procedure) (F))) 5)

(((lambda (X)
    ((lambda (procedure)
       (X (lambda (arg) ((procedure procedure) arg))))
     (lambda (procedure)
       (X (lambda (arg) ((procedure procedure) arg))))) ) F*) 5)


(define Y
  (lambda (X)
    ((lambda (procedure)
       (X (lambda (arg) ((procedure procedure) arg))))
     (lambda (procedure)
       (X (lambda (arg) ((procedure procedure) arg)))))))

(define M*
  (lambda (func-arg)
    (lambda (m l)
      (if (null? (cdr l))
          m
          (func-arg (> m (car l)) (cdr l))))))
(define M
  (lambda (func-arg)
    (lambda (l)
      (if (null? l)
          'no-list
          (if (null? (cdr l))
              (car l)
              (M* (car l) (func-arg (cdr l))))))))

((Y M) '(2 201089210 4 5 21 66 2 31))
;((Y F*) 10000)
