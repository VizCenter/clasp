(defun fibn (reps num)
  (declare (optimize speed (safety 0) (debug 0))
           (fixnum reps num))
  (let ((z 0))
    (declare (fixnum z))
    (dotimes (r reps)
      (declare (fixnum r))
      (let ((p1 1)
            (p2 1))
        (declare (fixnum p1 p2))
        (dotimes (i (- num 2))
          (declare (fixnum i))
          (setf z (+ p1 p2)
                p2 p1
                p1 z))))
    z))


#+(or)(defun fibn (reps num)
        (declare (optimize (speed 3) (safety 0) (debug 0)))
        (let ((rnum 0)
              (p1 0)
              (p2 0)
              (z 0))
          (declare (type fixnum reps num rnum p1 p2 z))
          (dotimes (r reps)
            (setf p1 1
                  p2 1
                  rnum (- num 2))
            (dotimes (i rnum)
              (setf z (+ p1 p2)
                    p2 p1
                    p1 z)))
          z))

;;; (compile-file "sys:tests;tfib.lsp")
;;; (load "sys:tests;tfib.fasl")


;; (time (fibn 10000000 78))
