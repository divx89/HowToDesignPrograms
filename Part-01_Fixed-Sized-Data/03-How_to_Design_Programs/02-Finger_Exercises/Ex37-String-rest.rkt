;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex37-String-rest) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; string-rest

;; String -> String
;; Given a string str, return another, with the 1st letter removed
;; Given:
;;   hello
;; Expected:
;;   ello

(define (string-rest str)
  (substring str 1))