local N = tonumber(io.read())
local tabela = {}

for i = 1, N do
    print("Digite o elemento " ..i.. ":")
    tabela[i] = tonumber(io.read())
end

local k = tonumber(io.read())

function filtrarMaiores(tabela, limite)
    for i = 1, N do
        if tabela[i] > limite then
            print(tabela[i])
        end
    end
end

print("-- Elementos maiores que " ..k.. " --")
filtrarMaiores(tabela, k)