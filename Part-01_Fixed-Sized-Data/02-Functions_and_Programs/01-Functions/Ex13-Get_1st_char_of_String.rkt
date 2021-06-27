;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex13-Get_1st_char_of_String) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH 1 - Section 2 - Sub-Section 1 - Exercise 13
;; Define the function string-first, which extracts the first 1String from a non-empty string.

(define (string-first str)
  (cond [(= (string-length str) 0) ""] 
        [else (string-ith str 0)]))