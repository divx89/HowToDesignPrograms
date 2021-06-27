;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex04-String-Position-Char-Removal) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
; Define a String, and a position
(define str "helloworld")
(define i 5)

; Remove the character at the position i within string str
(string-append (substring str 0 i) (substring str (+ i 1)))