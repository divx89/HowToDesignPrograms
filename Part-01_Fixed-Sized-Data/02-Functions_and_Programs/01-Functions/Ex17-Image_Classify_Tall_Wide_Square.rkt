;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex17-Image_Classify_Tall_Wide_Square) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH 1 - Section 2 - Sub-Section 1 - Exercise 17
;; Define the function image-classify, which consumes an image and conditionally produces "tall"
;; if the image is taller than wide, "wide" if it is wider than tall, or "square" if its width and height are the same.

(require 2htdp/image)

(define (image-classify img)
  (cond [(> (image-height img) (image-width img)) "tall"]
        [(< (image-height img) (image-width img)) "wide"]
        [else "square"]))