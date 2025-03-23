function SNR(Pin,Pout)
    return 10*log(Pout/Pin)
end

# Testowanie funkcji SQNR
Po=100
Pi=25
noiseratio=SNR(Pi,Po)
println(noiseratio)