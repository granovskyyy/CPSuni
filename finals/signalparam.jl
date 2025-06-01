using LinearAlgebra
#parametry sygnalow 
function mean(x::AbstractVector)::Number
    sum(x)/length(x)
end
function energy(x::AbstractVector)::Real 
    sum(abs2,x)
end
function power(x::AbstractVector)::Real 
    energy(x)/length(x)
end
function rms(x::AbstractVector)::Real 
    sqrt(power(x))
end

    
