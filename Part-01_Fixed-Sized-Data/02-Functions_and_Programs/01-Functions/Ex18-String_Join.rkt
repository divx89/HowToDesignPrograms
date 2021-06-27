;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex18-String_Join) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH 1 - Section 2 - Sub-Section 1 - Exercise 18
;; Define the function string-join, which consumes two strings and appends them with "_" in between.

(define (string-join str1 str2)
  (string-append str1 "_" str2))