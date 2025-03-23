

function SQNR(N)
    """
    Oblicza teoretyczny stosunek mocy sygnału do mocy szumu kwantyzacji (SQNR) w dB
    dla idealnego N-bitowego przetwornika A/C.
    
    :param N: Liczba bitów przetwornika A/C.
    :return: Wartość SQNR w dB.
    """
    return 6.02 * N + 1.76
end

# Testowanie funkcji SQNR
test_bits = [4, 8, 12, 16]
sqnr_values = [SQNR(N) for N in test_bits]
println(sqnr_values)
