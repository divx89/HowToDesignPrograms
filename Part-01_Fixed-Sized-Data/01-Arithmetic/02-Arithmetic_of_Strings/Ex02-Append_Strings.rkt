;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex02-Append_Strings) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Define two String variables
(define prefix "hello")
(define suffix "world")

; Append the two variables with underscore as the separator
(string-append prefix "_" suffix)