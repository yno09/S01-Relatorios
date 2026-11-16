(defstruct garota-magica
  nome
  escuridao
  bruxas)

(defun escuridao-total (grupo)
  (if (null grupo)
      0
      (+ (garota-magica-escuridao (car grupo))
         (escuridao-total (cdr grupo)))))

(defun total-de-bruxas (grupo)
  (reduce #'+ (mapcar #'garota-magica-bruxas grupo)))

(defun purifica (g quantidade)
  (make-garota-magica
   :nome (garota-magica-nome g)
   :escuridao (if (>= quantidade (garota-magica-escuridao g))
                  0
                  (- (garota-magica-escuridao g) quantidade))
   :bruxas (garota-magica-bruxas g)))

(defun main ()
  (let* ((madoka (make-garota-magica :nome "Madoka" :escuridao 10 :bruxas 0))
         (sayaka (make-garota-magica :nome "Sayaka" :escuridao 70 :bruxas 4))
         (mami   (make-garota-magica :nome "Mami"   :escuridao 35 :bruxas 15))
         (grupo  (list madoka sayaka mami)))

    (format t "Escuridao total do grupo: ~a~%" (escuridao-total grupo))
    (format t "Total de bruxas derrotadas: ~a~%" (total-de-bruxas grupo))

    (let* ((homura (make-garota-magica :nome "Homura" :escuridao 50 :bruxas 8))
           (grupo-novo (cons homura grupo)))
      (format t "~%Escuridao total do grupo antigo: ~a~%" (escuridao-total grupo))
      (format t "Escuridao total do grupo novo: ~a~%" (escuridao-total grupo-novo)))

    (let ((purificada (purifica  30)))
      (format t "~%Escuridao original de ~a: ~a~%"
              (garota-magica-nome sayaka) (garota-magica-escuridao sayaka))
      (format t "Escuridao apos purificar 30: ~a~%"
              (garota-magica-escuridao purificada)))))

(main)