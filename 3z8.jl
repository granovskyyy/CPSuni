function sawtooth_wave(t)
    return 1-2*mod(t,1)
end


for i in -1:0.1:3
    println(sawtooth_wave(i))
  end
  