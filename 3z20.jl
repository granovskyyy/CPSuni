
using FFTW

function impulse_repeater_bl(g::Function, t1::Real, t2::Real, B::Real)
    T = t2 - t1
    if T <= 0 || B <= 0
        error("t2 musi być > t1, B musi być > 0")
    end

    # Liczba próbek (im więcej, tym dokładniejsze FFT)
    N = 2^12
    dt = T / N
    t_samples = [t1 + i * dt for i in 0:N-1]
    x_samples = [g(t) for t in t_samples]

    # FFT i filtracja
    Xf = fft(x_samples)
    freqs = [i / T for i in 0:N-1]

    # Ograniczenie pasma do ±B
    for i in 1:N
        f = freqs[i] > N ÷ 2 ? freqs[i] - N / T : freqs[i]
        if abs(f) > B
            Xf[i] = 0.0
        end
    end

    # IFFT – odwrotna transformata Fouriera
    x_filtered = real.(ifft(Xf))

    # Zwracamy funkcję okresową z pasmowym ograniczeniem
    return t -> begin
        t_mod = mod(t - t1, T)
        idx = Int(round(t_mod / dt)) % N + 1
        return x_filtered[idx]
    end
end

g = t -> abs(t - 2)
fB = impulse_repeater_bl(g, -1, 1, 10.0)

t_vals = 0:0.01:10
y_vals = [fB(t) for t in t_vals]

# Jeżeli chcesz, możesz to wydrukować lub narysować:
using CairoMakie
f = Figure()
Axis(f[1, 1], title="Ograniczony pasmowo impuls okresowy", xlabel="t", ylabel="x(t)")
lines!(t_vals, y_vals, color=:red)
save("impulse_bl.png", f)