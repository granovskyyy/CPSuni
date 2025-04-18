
function square_wave(t)
   t_mod= mod(t,1)
   if  t_mod== 0 || t_mod == 0.5
        return 0
   elseif 0<t_mod<0.5
        return 1
   else 
        return -1
   end
end


for i in -1:0.1:3
    println(square_wave(i))
  end
  