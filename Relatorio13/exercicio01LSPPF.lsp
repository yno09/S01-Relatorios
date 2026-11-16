(defstruct erva
  nome
  preco-por-grama
  toxicidade)

(defun classifica-erva (erva)
  (let ((tox (erva-toxicidade erva)))
    (cond ((>= tox 7) "veneno")
          ((>= tox 4) "use com cuidado")
          (t "segura"))))

(defun preco-da-dose (erva gramas)
  (* (erva-preco-por-grama erva) gramas))

(defun descreve-erva (erva)
  (format nil "~a - R$ ~,2F por grama - ~a"
          (erva-nome erva)
          (erva-preco-por-grama erva)
          (classifica-erva erva)))

(defun aviso (erva)
  (if (>= (erva-toxicidade erva) 7)
      (format nil "Aviso: Maomao vai testar ~a em si mesma antes de qualquer coisa!"
              (erva-nome erva))
      (format nil "~a esta liberada para o paciente."
              (erva-nome erva))))

(defun main ()
  (let ((ervas (list (make-erva :nome "Camomila" :preco-por-grama 0.5  :toxicidade 1)
                     (make-erva :nome "Beladona" :preco-por-grama 4.8  :toxicidade 5)
                     (make-erva :nome "Aconito"  :preco-por-grama 12.0 :toxicidade 9))))
    (dolist (e ervas)
      (format t "~a~%~a~%~%" (descreve-erva e) (aviso e)))
    (format t "Preco de uma dose de 15g de ~a: R$ ~,2F~%"
            (erva-nome (second ervas))
            (preco-da-dose (second ervas) 15))))

(main)