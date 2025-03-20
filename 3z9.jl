
function triangular_wave(t)
    return 1-4*abs(mod(t,1)-1/4)
end


for i in -1:0.1:3
    println(triangular_wave(i))
  end
  