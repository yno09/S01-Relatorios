pesoMaximo :: Double
pesoMaximo = 10.0

-- Tentativa de redefinir pesoMaximo (gera erro se descomentada)
-- pesoMaximo = 15.0

data Encomenda = Encomenda
    { destinatario :: String
    , peso :: Double
    , frete :: Double
    }

descrever :: Encomenda -> String
descrever encomenda =
    "Destinatario: " ++ destinatario encomenda
    ++ " | Peso: " ++ show (peso encomenda) ++ " kg"
    ++ " | Frete: R$ " ++ show (frete encomenda)

cabemNaVassoura :: [Encomenda] -> [Encomenda]
cabemNaVassoura encomendas =
    filter (\encomenda -> peso encomenda <= pesoMaximo) encomendas

totalDeFretes :: [Encomenda] -> Double
totalDeFretes encomendas =
    sum (map frete encomendas)

main :: IO ()
main = do
    let encomendas =
            [ Encomenda "Alice" 5.0 12.50
            , Encomenda "Bob" 12.0 20.00
            , Encomenda "Carlos" 8.0 15.00
            , Encomenda "Diana" 15.0 25.00
            ]

    putStrLn "Todas as encomendas:"
    mapM_ (putStrLn . descrever) encomendas

    putStrLn "Encomendas que cabem na vassoura:"
    mapM_ (putStrLn . descrever) (cabemNaVassoura encomendas)

    putStrLn "Total de fretes das encomendas que cabem:"
    print (totalDeFretes (cabemNaVassoura encomendas))