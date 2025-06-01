using LinearAlgebra

function quantize(U::AbstractVector)::Function
    x-> U[argmin(abs.(-U.+x))]
end
    

