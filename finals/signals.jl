using LinearAlgebra


function rampwave(t::Real)::Real
    2*rem(t,1,RoundNearest)
end

function sawtoothwave(t::Real)::Real
    -2*rem(t,1,RoundNearest)
end

function triangularwave(t::Real)::Real
    ifelse(mod(t+1/4,1.0)<0.5, 4*mod(t+1/4,1.0)-1, -4*mod(t+1/4,1.0)+3)
end
function squarewave(t::Real)::Real
    ifelse(mod(t,1)<0.5,1,-1)
end