function ramp_wave(t)
    return 2*(mod(t,1))-1
end

for i in -1:0.1:1
  println(ramp_wave(i))
end
