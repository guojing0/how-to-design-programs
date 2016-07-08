;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname car-control) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;#lang racket
(require 2htdp/universe)
(require 2htdp/image)

(define Y-CAR 100)
(define WIDTH-OF-WORLD 400)
(define WHEEL-RADIUS 8)
(define WHEEL-DISTANCE (* WHEEL-RADIUS 4))

(define WHEEL (circle WHEEL-RADIUS "solid" "black"))
(define SPACE (rectangle WHEEL-DISTANCE WHEEL-RADIUS "solid" "white"))
(define BOTH-WHEELS (beside WHEEL SPACE WHEEL))
(define CAR-BODY (rectangle (* WHEEL-DISTANCE 2) 20 "solid" "red"))
(define BACKGROUND (empty-scene WIDTH-OF-WORLD Y-CAR))

(define tree
  (underlay/xy (circle 10 "solid" "green")
               9 15
               (rectangle 2 20 "solid" "brown")))

(define (render ws)
  (place-image BOTH-WHEELS ws (- Y-CAR WHEEL-RADIUS)
               (place-image CAR-BODY ws (- Y-CAR 20)
                            (place-image tree 300 (- Y-CAR 20) BACKGROUND))))

(define (tock ws)
  (+ ws 3))

(define (hyper x-position-of-car x-mouse y-mouse me)
  (cond
    [(string=? me "button-down") x-mouse]
    [else x-position-of-car]))

;(define (end? ws)
;  (= ws WIDTH-OF-WORLD))

(define (main ws)
  (big-bang ws
            [on-tick tock]
            [on-mouse hyper]
            [to-draw render]))

(main 0)