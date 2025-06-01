using LinearAlgebra
function interpolation(m::AbstractVector,s::AbstractVector)::Function
    return x -> begin
        sum=0.0
        dt=m[2]-m[1]
        for i in eachindex(m)
            sum += s[i] *sinc((x-m[i])/dt)
        end
        return sum
    end
end