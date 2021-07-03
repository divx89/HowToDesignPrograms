;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex34-string-first) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; string-first

;; String -> String
;; Return the 1st character of a string str, assuming it is not empty
;; given:
;;   hello for str
;; expected:
;;   h

(define (string-first str)
  (substring str 0 1))