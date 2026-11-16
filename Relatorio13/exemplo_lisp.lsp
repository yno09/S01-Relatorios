; PF COM LISP: LOJA DE JOGOS
; exemplo da aula do Relatório 13, com a sintaxe que os slides deixaram
; para o código: variáveis, funções, condições, listas, estruturas e saída

; COMO RODAR
; no terminal:   sbcl --script exemplo_steam.lsp
;                (ou, com o CLISP:  clisp exemplo_steam.lsp)
; no REPL:       sbcl   e depois   (load "exemplo_steam.lsp")
; sem instalar:  cole o arquivo em tio.run, escolha Common Lisp e rode

; COMO O ARQUIVO SE ORGANIZA
; ao contrário do Haskell, aqui o arquivo é lido de cima para baixo, uma
; expressão por vez: cada coisa precisa ser definida antes de ser usada,
; e por isso a chamada (main) fica na última linha
; tudo antes do main é puro: só recebe valores e devolve valores
; o ponto e vírgula começa um comentário, como o -- do Haskell e o # do
; Python


; VARIÁVEL GLOBAL COM defparameter
; defparameter dá nome a um valor visível no arquivo inteiro
; a convenção dos *asteriscos* avisa que o nome é global
; aqui ela é usada como constante: nenhuma função muda o seu valor, por
; isso as funções que a leem continuam puras
(defparameter *taxa-imposto* 1.15)


; ESTRUTURA DE DADOS COM defstruct
; defstruct cria um tipo com campos nomeados, como o data com campos
; nomeados do Haskell (ou uma classe só com atributos, em Java)
; esta única definição gera várias funções prontas:
;   make-jogo          cria um jogo:  (make-jogo :titulo "X" :preco 10)
;   jogo-titulo, ...   lê um campo:   (jogo-titulo j)
;   copy-jogo          faz uma cópia: (copy-jogo j)
; diferente do Haskell, os campos de um defstruct PODEM ser alterados
; (com setf); neste exemplo, por estilo funcional, nenhum jogo é
; alterado: criamos um jogo novo (veja processa-jogo e o fim do main)
(defstruct jogo
  titulo
  tipo            ; uma keyword: :acao, :rpg, :simulacao ou :aventura
  preco
  forca-magica)


; LISTA COM list
; list cria uma lista com o valor de cada argumento, nesta ordem
; aqui, cada argumento é uma chamada de make-jogo que cria um jogo
; :titulo, :tipo... são keywords: nomes que começam com : e valem a si
; mesmos; no make-jogo, cada keyword indica o campo que recebe o valor
; o tipo do jogo também é uma keyword (:rpg, :acao...): é o jeito Lisp
; de fazer o "tipo com opções" do Haskell (data Situacao = EmDia | ...)
(defparameter *catalogo*
  (list
   (make-jogo :titulo "Persona 3 Reload" :tipo :rpg
              :preco 300 :forca-magica 95)
   (make-jogo :titulo "Cyberpunk 2077" :tipo :acao
              :preco 150 :forca-magica 70)
   (make-jogo :titulo "Devil May Cry 5" :tipo :acao
              :preco 100 :forca-magica 90)
   (make-jogo :titulo "Stardew Valley" :tipo :simulacao
              :preco 40 :forca-magica 40)
   (make-jogo :titulo "Overwatch" :tipo :acao
              :preco 0 :forca-magica 75)
   (make-jogo :titulo "Hollow Knight" :tipo :aventura
              :preco 30 :forca-magica 88)))


; FUNÇÃO PURA COM defun
; estrutura: (defun nome (parâmetros) corpo)
; não existe return: a função devolve o valor da última expressão
; recebe um preço e devolve outro, sem alterar nada fora dela
; (* preco *taxa-imposto*) é a notação prefixa de preco * taxa
; exemplo: (adiciona-imposto 100) resulta em 115.0
(defun adiciona-imposto (preco)
  (* preco *taxa-imposto*))


; CONDIÇÕES COM cond
; cond testa as cláusulas de cima para baixo, como os guards do Haskell
; cada cláusula é (teste resultado), e a primeira com teste verdadeiro
; decide o valor
; o t (verdadeiro) no fim é o "senão", como o otherwise do Haskell
; (> forca 80) é a notação prefixa de forca > 80
(defun bonus-maldicao (forca)
  (cond ((> forca 80) (* forca 1.5))
        (t forca)))


; CONDIÇÕES COM case
; case compara um valor com opções fixas, uma por cláusula, como o
; pattern matching nas opções de um tipo do Haskell
; funciona com keywords e números, mas NÃO com strings (para comparar
; strings, use cond com string=)
; otherwise pega qualquer valor que não apareceu nas cláusulas de cima
(defun nome-do-tipo (tipo)
  (case tipo
    (:acao      "Acao")
    (:rpg       "RPG")
    (:simulacao "Simulacao")
    (:aventura  "Aventura")
    (otherwise  "Outro")))


; CONDIÇÃO COM if
; estrutura: (if teste valor-se-verdadeiro valor-se-falso)
; como no Haskell, o if é uma expressão: ele vale um dos dois textos
; zerop responde se o número é zero; funções que respondem sim ou não
; costumam terminar em p, de "predicado"
; format com destino nil não imprime nada: DEVOLVE o texto montado, por
; isso esta função continua pura
; ~,2f escreve o número com duas casas decimais
(defun exibe-preco (preco)
  (if (zerop preco)
      "Gratuito"
      (format nil "R$~,2f" preco)))


; NOMES LOCAIS COM let
; estrutura: (let ((nome valor) (nome valor)) corpo)
; os nomes só existem dentro do let, como no let ... in do Haskell, e o
; valor do let é o da última expressão do corpo
; (jogo-titulo j) lê o campo titulo do jogo j
; no format, ~a insere um valor e ~,1f escreve um número com uma casa
(defun exibe-jogo (j)
  (let ((tipo  (nome-do-tipo (jogo-tipo j)))
        (preco (exibe-preco (jogo-preco j))))
    (format nil "~a (~a) - ~a - Forca Magica ~,1f"
            (jogo-titulo j) tipo preco (jogo-forca-magica j))))


; FUNÇÃO SEM NOME (lambda) E FILTRO COM remove-if-not
; (lambda (j) ...) é uma função sem nome, como o \j -> ... do Haskell
; remove-if-not recebe uma função de teste e uma lista, e devolve uma
; lista NOVA só com os elementos que passaram ("remova se não passar")
; é o filter do Haskell; a lista recebida não é alterada
; eq compara keywords: (eq :acao :acao) resulta em T (verdadeiro)
(defun filtra-por-tipo (tipo catalogo)
  (remove-if-not (lambda (j) (eq (jogo-tipo j) tipo))
                 catalogo))


; "ALTERAR" UM JOGO = CRIAR OUTRO
; em vez de mudar o jogo recebido, montamos um jogo NOVO com make-jogo,
; copiando os campos que ficam iguais e recalculando os outros
; o jogo original continua do jeito que era: imutabilidade por escolha
(defun processa-jogo (j)
  (make-jogo :titulo       (jogo-titulo j)
             :tipo         (jogo-tipo j)
             :preco        (adiciona-imposto (jogo-preco j))
             :forca-magica (bonus-maldicao (jogo-forca-magica j))))


; PASSOS EM SEQUÊNCIA COM let* E TRANSFORMAÇÃO COM mapcar
; let* é como o let, mas cada nome pode usar os nomes de cima
; mapcar aplica uma função a cada elemento e devolve uma lista nova com
; os resultados: é o map do Haskell
; #'processa-jogo passa a função processa-jogo como argumento; o #' é
; necessário para funções com nome (uma lambda não precisa dele)
; o mesmo resultado sairia aninhando as chamadas, como na composição:
;   (mapcar #'processa-jogo (filtra-por-tipo :acao catalogo))
(defun processa-venda (catalogo)
  (let* ((acao    (filtra-por-tipo :acao catalogo))
         (prontos (mapcar #'processa-jogo acao)))
    prontos))


; RECURSÃO COM car E cdr
; como no Haskell, não usamos for nem while: a função chama a si mesma
; com o resto da lista
;   (null lista)  responde se a lista está vazia: é o caso base, como o
;                 padrão [] do Haskell
;   (car lista)   é o primeiro elemento, como o x de (x:xs)
;   (cdr lista)   é o resto da lista, como o xs de (x:xs)
; passo a passo, com preços 300, 150 e 100:
;   300 + (150 + (100 + 0)) = 550
(defun soma-precos (lista)
  (if (null lista)
      0
      (+ (jogo-preco (car lista))
         (soma-precos (cdr lista)))))


; FUNÇÃO PRINCIPAL E SAÍDA
; em Lisp não existe um main obrigatório: o nome é só uma convenção, e a
; função é chamada na última linha do arquivo
; tudo acima é puro; aqui fica o que conversa com o mundo (o terminal)
; format com destino t IMPRIME o texto; ~% é a quebra de linha
; dolist repete uma ação para cada item: (dolist (item lista) corpo)
; ele existe para efeitos, como imprimir; para calcular, use mapcar
(defun main ()
  (format t "--- Catalogo da Loja ---~%")
  (dolist (j *catalogo*)
    (format t "~a~%" (exibe-jogo j)))

  (format t "--- Jogos de Acao com Imposto e Bonus ---~%")
  (dolist (j (processa-venda *catalogo*))
    (format t "~a~%" (exibe-jogo j)))

  ; LISTAS: car, cons E UMA LISTA COM ASPA
  ; (car *catalogo*) é o primeiro jogo do catálogo
  ; cons cria uma lista NOVA com um elemento na frente; o catálogo não
  ; muda (como o : do Haskell)
  ; '(:rpg :acao :luta) é uma lista de dados: a aspa impede a execução
  (format t "--- Listas ---~%")
  (format t "Primeiro jogo: ~a~%" (jogo-titulo (car *catalogo*)))
  (format t "Total de jogos: ~a~%" (length *catalogo*))
  (let ((com-lancamento
          (cons (make-jogo :titulo "Hades II" :tipo :acao
                           :preco 90 :forca-magica 85)
                *catalogo*)))
    (format t "Com o lancamento: ~a jogos (o catalogo continua com ~a)~%"
            (length com-lancamento) (length *catalogo*)))
  (format t "Tipos: ~a~%" (mapcar #'nome-do-tipo '(:rpg :acao :luta)))

  ; RECURSÃO E reduce
  ; reduce combina todos os elementos em um só valor, como o sum do
  ; Haskell; #'+ passa a soma como função
  ; #'jogo-preco: as funções criadas pelo defstruct também são valores
  (format t "--- Recursao e reduce ---~%")
  (format t "Soma dos precos (recursao): ~a~%"
          (exibe-preco (soma-precos *catalogo*)))
  (format t "Soma dos precos (reduce): ~a~%"
          (exibe-preco (reduce #'+ (mapcar #'jogo-preco *catalogo*))))

  ; CONTRASTE: O LISP PERMITE ALTERAR
  ; setf muda um campo NO LUGAR (estilo imperativo): o Haskell não deixa
  ; isso acontecer, o Lisp deixa, e neste exemplo evitamos
  ; a alteração é feita numa cópia (copy-jogo) para o catálogo continuar
  ; igual
  (format t "--- O Lisp permite alterar (setf) ---~%")
  (let ((copia (copy-jogo (car *catalogo*))))
    (setf (jogo-preco copia) 0)
    (format t "Copia alterada com setf: ~a~%"
            (exibe-preco (jogo-preco copia)))
    (format t "Catalogo continua igual: ~a~%"
            (exibe-preco (jogo-preco (car *catalogo*))))))


; chamada da função principal: precisa vir depois de todas as definições
(main)


; SAÍDA DO PROGRAMA
; --- Catalogo da Loja ---
; Persona 3 Reload (RPG) - R$300.00 - Forca Magica 95.0
; Cyberpunk 2077 (Acao) - R$150.00 - Forca Magica 70.0
; Devil May Cry 5 (Acao) - R$100.00 - Forca Magica 90.0
; Stardew Valley (Simulacao) - R$40.00 - Forca Magica 40.0
; Overwatch (Acao) - Gratuito - Forca Magica 75.0
; Hollow Knight (Aventura) - R$30.00 - Forca Magica 88.0
; --- Jogos de Acao com Imposto e Bonus ---
; Cyberpunk 2077 (Acao) - R$172.50 - Forca Magica 70.0
; Devil May Cry 5 (Acao) - R$115.00 - Forca Magica 135.0
; Overwatch (Acao) - Gratuito - Forca Magica 75.0
; --- Listas ---
; Primeiro jogo: Persona 3 Reload
; Total de jogos: 6
; Com o lancamento: 7 jogos (o catalogo continua com 6)
; Tipos: (RPG Acao Outro)
; --- Recursao e reduce ---
; Soma dos precos (recursao): R$620.00
; Soma dos precos (reduce): R$620.00
; --- O Lisp permite alterar (setf) ---
; Copia alterada com setf: Gratuito
; Catalogo continua igual: R$300.00
