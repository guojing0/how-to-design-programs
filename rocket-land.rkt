#lang racket
(require 2htdp/image)
(require 2htdp/universe)

(define ROCKET "ROCKET_IMAGE")

(define WIDTH  200)
(define HEIGHT 400)

(define A 0.1)
(define X (/ WIDTH 2))

(define MTSCN  (empty-scene WIDTH HEIGHT))
(define ROCKET-CENTER-TO-BOTTOM
  (- HEIGHT (/ (image-height ROCKET) 2)))

(define (distance t) (* 0.5 A (sqr t)))

(define (create-rocket-scene t)
  (cond
    [(<= (distance t) ROCKET-CENTER-TO-BOTTOM)
     (place-image ROCKET X (distance t) MTSCN)]
    [(> (distance t) ROCKET-CENTER-TO-BOTTOM)
     (place-image ROCKET X ROCKET-CENTER-TO-BOTTOM MTSCN)]))

(animate create-rocket-scene)