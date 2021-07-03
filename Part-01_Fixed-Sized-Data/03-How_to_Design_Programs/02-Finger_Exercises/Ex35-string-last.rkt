;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex35-string-last) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; string-last

;; String -> String
;; Given a non-empty string str, return its last character
;; given:
;;    hello
;; expected:
;;    o

(define (string-last str)
  (substring str (- (string-length str) 1)))