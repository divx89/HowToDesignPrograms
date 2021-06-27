;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex01) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Define two variables - A point on the coordinate plane
(define x 3)
(define y 4)

; Calculate the distance between point (0,0) and (x,y)
; Formula = sqrt[(x**2 + (y**2)]

(sqrt (+ (* x x) (* y y)))