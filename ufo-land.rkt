#lang racket
(require 2htdp/image)
(require 2htdp/universe)

; constants
(define HEIGHT 300)
(define WIDTH 200)
(define MTSCN (rectangle WIDTH HEIGHT "solid" "blue"))
(define UFO
  (overlay (circle 10 "solid" "green")
           (rectangle 40 4 "solid" "green")))

(define UFO-CENTER-TO-BOTTOM (- HEIGHT (/ (image-height UFO) 2)))

(define SEMI-WIDTH (/ WIDTH 2))
(define (slope-flight y) (* y (/ WIDTH HEIGHT)))

(define (place-ufo h)
  (place-image UFO
               (slope-flight h) h
               (place-image (rectangle WIDTH 10 "solid" "brown")
                            SEMI-WIDTH (- HEIGHT 5)
                            MTSCN)))

; functions
(define (create-ufo-scene h)
  (cond
    [(<= h (- UFO-CENTER-TO-BOTTOM 10))
     (place-ufo h)]
    [(> h (- UFO-CENTER-TO-BOTTOM 10))
     (place-ufo (- UFO-CENTER-TO-BOTTOM 10))]))

(animate create-ufo-scene)