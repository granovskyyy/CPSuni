function quantize(L)
    function f_L(x)
        return L[argmin(abs.(L .- x))]  # Znajdujemy najbliższy poziom
    end
    
    return f_L
end

# Przykład użycia:
L = [-2.0, 0.0, 1.5, 3.0]  # Poziomy kwantyzacji
quantizer = quantize(L)

# Testowanie funkcji kwantyzacji
test_values = [-1.0, 0.7, 2.8, 3.5]
quantized_values = [quantizer(x) for x in test_values]
println(quantized_values)
