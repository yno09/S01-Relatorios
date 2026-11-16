(defstruct criatura
  nome
  bioma
  profundidade
  perigo)

(defun texto-do-perigo (perigo)
  (case perigo
    (:inofensiva "Inofensiva")
    (:agressiva "Agressiva")
    (:leviata "cuthulu: mantenha distancia")
    (otherwise "Desconhecido")))

(defun descreve-criatura (c)
  (format nil "~a | Bioma: ~a | Profundidade: ~am | Perigo: ~a"
          (criatura-nome c)
          (criatura-bioma c)
          (criatura-profundidade c)
          (texto-do-perigo (criatura-perigo c))))

(defun abaixo-de (metros catalogo)
  (remove-if-not (lambda (c) (> (criatura-profundidade c) metros))
                 catalogo))

(defparameter *catalogo*
  (list (make-criatura :nome "eric"
                       :bioma "itajuba"
                       :profundidade 20
                       :perigo :inofensiva)
        (make-criatura :nome "dudu"
                       :bioma "deserto"
                       :profundidade 80
                       :perigo :agressiva)
        (make-criatura :nome "beto"
                       :bioma "oceano"
                       :profundidade 120
                       :perigo :agressiva)
        (make-criatura :nome "david"
                       :bioma "taiga"
                       :profundidade 200
                       :perigo :leviata)))

(defun main ()
  (format t "=== Catalogo completo ===~%")
  (let ((textos (mapcar #'descreve-criatura *catalogo*)))
    (dolist (texto textos)
      (format t "~a~%" texto)))
  (format t "~%=== Abaixo de 100 metros ===~%")
  (let* ((fundas (abaixo-de 100 *catalogo*))
         (textos (mapcar #'descreve-criatura fundas)))
    (dolist (texto textos)
      (format t "~a~%" texto))
    (format t "~%Criaturas abaixo de 100m: ~a~%" (length fundas)))

  (format t "Total no catalogo: ~a~%" (length *catalogo*)))

(main)