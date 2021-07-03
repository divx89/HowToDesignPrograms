;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex38-string-remove-last) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; string-remove-last

;; String -> String
;; Given a string str, create another where the last character is removed
;; Given:
;;   hello
;; Expected:
;;   hell

(define (string-remove-last str)
  (substring str 0 (- (string-length str) 1)))