local N = tonumber(io.read())
local tabela = {}


for i = 1, N do
    print("Digite o elemento " ..i.. ":")
    tabela[i] = tonumber(io.read())
end

print("Digite o número X a ser buscado:")
local x = tonumber(io.read())

function contarOcorrencias(tabela, alvo)
    local count = 0
    for i = 1, #tabela do
        if x == tabela[i] then
            count = count + 1
        end
    end

    return count
end

local resultado = contarOcorrencias(tabela, x)
print("O número " ..x.. " aparece " ..resultado.. " vez(es) na tabela.")