;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex36-Image-Area) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; image-area

(require 2htdp/image)

;; Image -> Number
;; Return the area of an image img
;; given:
;;   rectange of sides 10 and 20
;; expected:
;;   200
(define (image-area img)
  (* (image-height img) (image-width img)))