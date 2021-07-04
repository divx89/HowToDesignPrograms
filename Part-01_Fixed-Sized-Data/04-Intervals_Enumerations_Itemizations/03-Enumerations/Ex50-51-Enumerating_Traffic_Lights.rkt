;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex50-Enumerating_Traffic_Lights) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; Ex.50 - Traffic Lights Enumeration - Complete test cases
;; Ex.51 - Changing Traffic Lights - Big-bang

(require 2htdp/universe)
(require 2htdp/image)

;;Constants
(define LIGHT-RADIUS 15)

(define FULL-RED (circle LIGHT-RADIUS "solid" "red"))
(define OUTLINE-RED (circle LIGHT-RADIUS "outline" "red"))

(define FULL-YELLOW (circle LIGHT-RADIUS "solid" "yellow"))
(define OUTLINE-YELLOW (circle LIGHT-RADIUS "outline" "yellow"))

(define FULL-GREEN (circle LIGHT-RADIUS "solid" "green"))
(define OUTLINE-GREEN (circle LIGHT-RADIUS "outline" "green"))

(define GAP 2)
(define BACKGROUND (rectangle (+ (* LIGHT-RADIUS 2) (* GAP 2)) (+ (* LIGHT-RADIUS 6) (* GAP 2)) "solid" "black"))
(define TL-X (/ (image-width BACKGROUND) 2))
(define TL-Y (/ (image-height BACKGROUND) 2))

(define RED-LIGHT (above FULL-RED
                         OUTLINE-YELLOW
                         OUTLINE-GREEN))
(define YELLOW-LIGHT (above OUTLINE-RED
                            FULL-YELLOW
                            OUTLINE-GREEN))
(define GREEN-LIGHT (above OUTLINE-RED
                           OUTLINE-YELLOW
                           FULL-GREEN))

;; Data Definitions

; A TrafficLight is one of the following Strings:
; – "red"
; – "green"
; – "yellow"
; interpretation the three strings represent the three 
; possible states that a traffic light may assume

(define TL1 "red")
(define TL2 "yellow")
(define TL3 "green")

;;Functions

; TrafficLight -> TrafficLight
; yields the next state given current state s
(check-expect (traffic-light-next "red") "green")
(check-expect (traffic-light-next "yellow") "red")
(check-expect (traffic-light-next "green") "yellow")

(define (traffic-light-next s)
  (cond
    [(string=? "red" s) "green"]
    [(string=? "green" s) "yellow"]
    [(string=? "yellow" s) "red"]))

; TrafficLight -> Image
; Draw an image of a traffic light

(check-expect (render-traffic-light "red") (place-image RED-LIGHT TL-X TL-Y  BACKGROUND))
(check-expect (render-traffic-light "yellow") (place-image YELLOW-LIGHT TL-X TL-Y BACKGROUND))
(check-expect (render-traffic-light "green") (place-image GREEN-LIGHT TL-X TL-Y BACKGROUND))

(define (render-traffic-light s)
  (cond [(string=? "red" s) (place-image RED-LIGHT TL-X TL-Y  BACKGROUND)]
        [(string=? "green" s) (place-image GREEN-LIGHT TL-X TL-Y BACKGROUND)]
        [else (place-image YELLOW-LIGHT TL-X TL-Y BACKGROUND)]))

;TrafficLight -> TrafficLight
;Program to simulate and display changing traffic lights
(define (main s)
  (big-bang s
    [on-tick traffic-light-next 1]
    [to-draw render-traffic-light]))