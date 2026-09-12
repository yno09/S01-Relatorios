print("Digite o primeiro numero:")
local N1 = tonumber(io.read())

print("Digite o segundo numero:")
local N2 = tonumber(io.read())

print("Digite a operação:")
local OP = io.read()

function analisarNumeros(n1, n2, operacao)

    function calcularMedia(n1, n2)
        return (n1 + n2) / 2
    end

    function encontrarMaior(n1, n2)
        if n1 > n2 then
            return n1
        else
            return n2
        end
    end

    function calcularDiferencaAbsoluta(n1, n2)
        return math.abs(n1 - n2)
    end

    if operacao == "media" then
        return calcularMedia(n1, n2)

    elseif operacao == "maior" then
        return encontrarMaior(n1, n2)

    elseif operacao == "diferenca" then
        return calcularDiferencaAbsoluta(n1, n2)

    else
        return "Operação inválida!"
    end
end

local resultado = analisarNumeros(N1, N2, OP)

print("Resultado: " .. resultado)