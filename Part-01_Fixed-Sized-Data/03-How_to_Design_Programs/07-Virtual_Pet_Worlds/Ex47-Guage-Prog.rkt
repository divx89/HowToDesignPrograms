;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex47-Guage-Prog) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;Ex.47-Happiness Guage
;;guage-prog

(require 2htdp/universe)
(require 2htdp/image)

;----------------
;   Constants
;----------------
(define HEIGHT 100)
(define  WIDTH  80)

(define BACKGROUND (empty-scene WIDTH HEIGHT))

(define DECREASE-RATE -0.1)
(define DOWN-KEY-DECREASE (- (/ 1 5)))
(define UP-KEY-INCREASE (/ 1 3))

;-----------------
; DATA DEFINITION
;-----------------
;; Happiness is a Number [0,100]
;; interpretation. happiness is represented by a number between 0 and 100

;-----------------
;   FUNCTIONS
;-----------------

;; Happiness -> Happiness
;; Decrease happiness with time

(check-expect (change-happiness 0) (add-rate 0 DECREASE-RATE))
(check-expect (change-happiness -1) 0)
(check-expect (change-happiness 100)  (add-rate 100 DECREASE-RATE))
(check-expect (change-happiness 101)  100)

(define (change-happiness h)
  (cond [(> h 100) 100]
        [(< h   0)   0]
        [else (add-rate h DECREASE-RATE)]))

;; Happiness -> Happiness
;; Given a happiness number and a rate of change, return the new happiness score by adding the two

(check-expect (add-rate 0 3) 3)
(check-expect (add-rate 9 -2) 7)

(define (add-rate h r)
  (+ h r))

;; Happiness -> Image
;; Render an image of the happiness number

(check-expect (render-happiness 50)
              (place-image (overlay/align "center" "bottom" (rectangle (- (/ HEIGHT 5) 1) 50 "solid" "red") 
                                          (rectangle (/ HEIGHT 5) (+ HEIGHT 1) "outline" "black"))
                           (/ WIDTH 2) HEIGHT BACKGROUND))

(define (render-happiness h)
  (place-image (overlay/align "center" "bottom" (rectangle (- (/ HEIGHT 5) 1) h "solid" "red") 
                              (rectangle (/ HEIGHT 5) (+ HEIGHT 1) "outline" "black"))
               (/ WIDTH 2) HEIGHT BACKGROUND))

;; Happiness KeyEvent -> Happiness
;; Increase or decrease happiness based on key pressed

(check-expect (handle-key 20   "up") (+ 20   UP-KEY-INCREASE))
(check-expect (handle-key 20 "down") (+ 20 DOWN-KEY-DECREASE))
(check-expect (handle-key 20    " ")    20                   )

(define (handle-key h ke)
  (cond [(key=? ke "up") (add-rate h UP-KEY-INCREASE)]
        [(key=? ke "down") (add-rate h DOWN-KEY-DECREASE)]
        [else h]))

;; Happiness -> Happiness
;; Create a happiness countdown, from 100 to 0
;; Start world state with (main 100)

(define (main h)
  (big-bang h
    [on-tick change-happiness]
    [to-draw render-happiness]
    [on-key handle-key]))