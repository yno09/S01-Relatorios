local m = tonumber(io.read())
local n = tonumber(io.read())  
local base = tonumber(io.read())

function gerarTabelaPotencias(inicio, fim, base) 
    for i = inicio, fim do
        print(base ^ i)
    end 
end

gerarTabelaPotencias(m,n,base)