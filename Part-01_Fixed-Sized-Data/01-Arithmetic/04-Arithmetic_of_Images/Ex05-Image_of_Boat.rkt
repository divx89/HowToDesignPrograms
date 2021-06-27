;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex05-Image_of_Boat) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH1 - Section 4 - Exercise 5
;; Create a boat shaped image
;; Idea - Solid rectangle overlaying a non-regular 4 sided polygon, and a right triangle with base on polygon

(require 2htdp/image)

(above/align "center" (right-triangle 30 50 "solid" "lightblue")
             (overlay (rectangle 60 10 "solid" "lightgreen")
                      (polygon (list (make-posn 0 0)
                                     (make-posn 100 0)
                                     (make-posn 90 20)
                                     (make-posn 10 20))
                               "solid"
                               "lightred")))