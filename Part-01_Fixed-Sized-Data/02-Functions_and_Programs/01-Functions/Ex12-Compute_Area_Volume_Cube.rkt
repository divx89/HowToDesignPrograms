;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex12-Function_Compute_Area_Volume_Cube) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH 1 - Section 2 - Sub-Section 1 - Exercise 12
;; Define the function cvolume, which accepts the length of a side of an equilateral cube and computes its volume.
;; If you have time, consider defining csurface, too.

;; volume = x**3
;; area = (x**2)*6

(define (cvolume x)
  (* x x x))

(define (csurface x)
  (* 6 (* x x)))