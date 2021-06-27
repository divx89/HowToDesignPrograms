;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex07-Evaluate_Boolean_Expressions) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH1 - Section 5 - Exercise 7
;; Evaluate boolean expressions

(define sunny #true)
(define friday #false)

(or (false? sunny)
    (not (false? friday)))