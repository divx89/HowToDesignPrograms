;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Car) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ex.39 - All Image related constants to be based on the WHEEL-RADIUS
;; Ex.40 - Unit tests for each function
;; Ex.41 - Completed Car program, with added scenery, and stop car functionality
;; Ex.42 - Distance to be till the right edge of the car
;; Ex.43 - Not Done [Not sure how to represent sine wave, and having worldstate as
;;                   clock ticks is same as having distance, because we can just assume that
;;                   distance from edge is same as the number of clock ticks]
;; Ex.44 - On mouse click, move X to the location of the mouse click's X

;; Moving Car

(require 2htdp/universe)
(require 2htdp/image)

;------------------------
;      Constants
;------------------------

(define WHEEL-RADIUS 5)

(define WIDTH (* WHEEL-RADIUS 50))
(define HEIGHT (/ WIDTH 2))
(define TREE
  (underlay/xy (circle WHEEL-RADIUS "solid" "green")
               (* WHEEL-RADIUS 0.8) WHEEL-RADIUS
               (rectangle (/ WHEEL-RADIUS 3) (* WHEEL-RADIUS 2) "solid" "brown")))

(define BG-RECTANGLE (rectangle WIDTH HEIGHT "outline" "black"))
(define BACKGROUND (place-image TREE
                                (* (image-width BG-RECTANGLE) 0.75) (* (image-height BG-RECTANGLE) 0.25)
                                BG-RECTANGLE))

(define WHEEL-DISTANCE (* WHEEL-RADIUS 2))

(define CAR-BODY-LENGTH (* WHEEL-RADIUS 8))
(define CAR-ROOF-LENGTH (/ CAR-BODY-LENGTH 2))
(define CAR-BODY-HEIGHT (/ CAR-BODY-LENGTH 4))
(define CAR-ROOF-HEIGHT (/ CAR-BODY-HEIGHT 2))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define WHEELS (beside WHEEL (rectangle WHEEL-DISTANCE 0 "solid" "black") WHEEL))
(define CAR (overlay/align "center" "bottom" WHEELS
                           (above (rectangle CAR-ROOF-LENGTH CAR-ROOF-HEIGHT "solid" "red" )
                                  (rectangle CAR-BODY-LENGTH CAR-BODY-HEIGHT "solid" "red")
                                  (rectangle CAR-BODY-LENGTH WHEEL-RADIUS "solid" "white"))))

(define CAR-START-X 0)
(define CAR-Y (- HEIGHT (/ (image-height CAR) 2)))
(define CAR-STOP-X (+ WIDTH (image-width CAR)))

(define CAR-SPEED (/ WHEEL-RADIUS 3))
;------------------------
;      Data Definitions
;------------------------
;; Distance is a Number
;; interpretation: The distance in pixels traveled by the car from the left edge

;------------------------
;      Functions
;------------------------

;; Distance -> Image
;; Draw the image of a car whose right edge is at a distance dist from the left edge

(check-expect (render-car 50) (place-image CAR (- 50 (/ CAR-BODY-LENGTH 2))  CAR-Y BACKGROUND))

(define (render-car dist)
  (place-image CAR (- dist (/ CAR-BODY-LENGTH 2)) CAR-Y BACKGROUND))

;; Distance -> Distance
;; Move the distance traveled by the car with on each clock tick

(check-expect (move-car 50) (+ 50 CAR-SPEED))

(define (move-car dist)
  (+ dist CAR-SPEED))

;; Distance -> Boolean
;; Stop car when it completely passes out of the right edge
(define (stop-car? dist)
  (> dist CAR-STOP-X))

;; Distance Number Number MouseEvent -> Distance
;; On button-down, move the distance to the X position of the mouse click

(check-expect (handle-click 50 80 20 "button-down") 80)
(check-expect (handle-click 50 80 20 "button-up") 50)

;(define (handle-click dist mouse-x mouse-y me) dist)

(define (handle-click dist mouse-x mouse-y me)
  (cond [(string=? "button-down" me) mouse-x]
        [else dist]))

;; Distance -> Distance
;; Place a car on a scene at a distance of dist pixels
;; from the left edge, and move it at a constant speed towards the right
;; Start the world by running (main CAR-START-X)

(define (main dist)
  (big-bang dist
    [on-tick move-car]
    [to-draw render-car]
    [stop-when stop-car?]
    [on-mouse handle-click]))