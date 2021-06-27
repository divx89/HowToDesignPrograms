;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex11-Function_Compute_Distance_from_Origin) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH 1 - Section 2 - Sub-Section 1 - Exercise 11
;; Define a function that consumes two numbers, x and y, and that computes the distance of point (x,y) to the origin.
;; x-distance = x; y-distance = y; final distance = sqrt(x**2 + y**2)

(define (f x y)
  (sqrt (+ (* x x) (* y y))))