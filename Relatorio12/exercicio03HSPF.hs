data Esboco = Esboco
    { titulo :: String
    , tecnica :: String
    , horas :: Int
    }

esbocoMaisRecente :: [Esboco] -> String
esbocoMaisRecente [] = "O caderno esta vazio!"
esbocoMaisRecente (e:_) =
    "Titulo: " ++ titulo e
    ++ " | Tecnica: " ++ tecnica e

contarEsbocos :: [Esboco] -> Int
contarEsbocos [] = 0
contarEsbocos (_:resto) = 1 + contarEsbocos resto

horasDesenhando :: [Esboco] -> Int
horasDesenhando [] = 0
horasDesenhando (e:resto) =
    horas e + horasDesenhando resto

main :: IO ()
main = do
    let caderno =
            [ Esboco "Paisagem" "Grafite" 3
            , Esboco "Retrato" "Nanquim" 5
            , Esboco "Natureza Morta" "Carvao" 2
            ]

    putStrLn "Esboco mais recente:"
    putStrLn (esbocoMaisRecente caderno)

    putStrLn "Numero de esbocos:"
    print (contarEsbocos caderno)

    putStrLn "Total de horas desenhando:"
    print (horasDesenhando caderno)

    putStrLn "Esboco mais recente de um caderno vazio:"
    putStrLn (esbocoMaisRecente [])

    let cadernoNovo = Esboco "Flor" "Carvao" 4 : caderno

    putStrLn "\nCaderno antigo:"
    putStrLn (esbocoMaisRecente caderno)
    print (contarEsbocos caderno)

    putStrLn "\nCaderno novo:"
    putStrLn (esbocoMaisRecente cadernoNovo)
    print (contarEsbocos cadernoNovo)

    -- Tentativa de acessar head de um caderno vazio
    -- putStrLn (titulo (head []))