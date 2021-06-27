;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex20-Delete_from_ith_posn_of_String) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH 1 - Section 2 - Sub-Section 1 - Exercise 20
;; Define the function string-delete, which consumes a string plus a number i and deletes the ith position from str.
;; Assume i is a number between 0 (inclusive) and the length of the given string (exclusive)

(define (string-delete str i)
  (string-append (substring str 0 i)
                 (substring str (cond [(= (string-length str) i) i]
                                      [else (+ i 1)]))))