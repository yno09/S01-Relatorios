data Etapa = NaFila | NoBanho | Concluido
    deriving (Show, Eq)

data Atendimento = Atendimento
    { cliente :: String
    , servico :: String
    , valor :: Double
    , etapa :: Etapa
    }

descrever :: Atendimento -> String
descrever atendimento =
    "Cliente: " ++ cliente atendimento
    ++ " | Servico: " ++ servico atendimento
    ++ " | Etapa: " ++ show (etapa atendimento)

concluir :: Atendimento -> Atendimento
concluir atendimento =
    atendimento { etapa = Concluido }

arrecadado :: [Atendimento] -> Double
arrecadado atendimentos =
    sum (map valor (filter (\a -> etapa a == Concluido) atendimentos))

main :: IO ()
main = do
    let atendimento1 = Atendimento "Alice" "Corte" 50.0 NaFila
    let atendimento2 = Atendimento "Bruno" "Barba" 30.0 NoBanho
    let atendimento3 = Atendimento "Carlos" "Corte e Barba" 80.0 NaFila

    let listaOriginal =
            [ atendimento1
            , atendimento2
            , atendimento3
            ]

    let listaNova =
            [ concluir atendimento1
            , atendimento2
            , concluir atendimento3
            ]

    putStrLn "Lista original:"
    mapM_ (putStrLn . descrever) listaOriginal

    putStrLn "Arrecadado na lista original:"
    print (arrecadado listaOriginal)

    putStrLn "Lista nova:"
    mapM_ (putStrLn . descrever) listaNova

    putStrLn "Arrecadado na lista nova:"
    print (arrecadado listaNova)