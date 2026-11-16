(defstruct dominio
  nome
  elemento
  dificuldade
  mora)

(defun bonus-elemental (elemento)
  (case elemento
    (:electro 1.5)
    (:hydro 1.2)
    (otherwise 1)))

(defun recompensa-final (d)
  (* (dominio-mora d)
     (bonus-elemental (dominio-elemento d))))

(defun rota (lista dificuldade-maxima)
  (let* ((filtrados (remove-if-not
                     (lambda (d) (<= (dominio-dificuldade d) dificuldade-maxima))
                     lista))
         (textos (mapcar (lambda (d)
                           (format nil "~a - recompensa final: ~,1F mora"
                                   (dominio-nome d)
                                   (recompensa-final d)))
                         filtrados)))
    textos))

(defun main ()
  (let ((dominios
          (list (make-dominio :nome "Vale da Fornalha" :elemento :pyro
                              :dificuldade 3 :mora 10000)
                (make-dominio :nome "Cume da Tempestade" :elemento :electro
                              :dificuldade 5 :mora 20000)
                (make-dominio :nome "Santuario das Aguas" :elemento :hydro
                              :dificuldade 4 :mora 15000)
                (make-dominio :nome "Caverna Gelada" :elemento :cryo
                              :dificuldade 2 :mora 8000)
                (make-dominio :nome "Ruinas do Vento" :elemento :anemo
                              :dificuldade 6 :mora 25000))))

    (format t "=== Rota (dificuldade maxima 4) ===~%")
    (dolist (texto (rota dominios 4))
      (format t "~a~%" texto))

    (format t "~%Total de mora da lista inteira: ~,1F~%"
            (reduce #'+ (mapcar #'recompensa-final dominios)))

    (let* ((original (first dominios))
           (copia (copy-dominio original)))
      (setf (dominio-mora copia) 99999)
      (format t "~%Mora da copia: ~a~%" (dominio-mora copia))
      (format t "Mora do original: ~a~%" (dominio-mora original)))))

(main)