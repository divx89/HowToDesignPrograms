;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname Ex31-Reading_Writing_Files) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;; CH 1 - Section 2 - Sub-Section 5 - Exercise 31
;; Given a function letter (see definition below), use the read-file to read the first, last and signature names
;; from 3 different files, and write the output from the letter function to another file

(require 2htdp/batch-io)

(define (letter fst lst signature-name)
  (string-append
   (opening fst)
   "\n\n"
   (body fst lst)
   "\n\n"
   (closing signature-name)))
 
(define (opening fst)
  (string-append "Dear " fst ","))
 
(define (body fst lst)
  (string-append
   "We have discovered that all people with the" "\n"
   "last name " lst " have won our lottery. So, " "\n"
   fst ", " "hurry and pick up your prize."))
 
(define (closing signature-name)
  (string-append
   "Sincerely,"
   "\n\n"
   signature-name
   "\n"))

(define (main in-fst in-lst in-signature out)
  (write-file out (letter (read-file in-fst)
                          (read-file in-lst)
                          (read-file in-signature))))
