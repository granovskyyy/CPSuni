using FFTW

function rand_signal_bl(f1::Real, f2::Real)
    if f1 <= 0 || f2 <= 0 || f1 >= f2
        error("Warunek: 0 < f1 < f2 musi być spełniony")
    end

    # Parametry sygnału
    T = 1.0  # okres (s) — arbitralnie
    N = 2^12  # liczba próbek
    df = 1 / T
    dt = T / N
    t_samples = [i * dt for i in 0:N-1]

    # Widmo Xf: zero poza pasmem
    Xf = zeros(ComplexF64, N)
    

    for i in 1:N
        f = (i-1) <= N ÷ 2 ? (i-1)*df : ((i-1)-N)*df
        if f1 < abs(f) < f2
            phase = 2π * rand()
            amp = 1.0
            Xf[i] = amp * cis(phase)
        end
    end

    # IFFT – sygnał w dziedzinie czasu
    x_t = real.(ifft(Xf))

    # Normalizacja mocy sygnału
    power = sum(x_t .^ 2) / N
    x_t ./= sqrt(power)  # skalowanie do mocy = 1.0

    # Zwracamy funkcję okresową
    return t -> begin
        t_mod = mod(t, T)
        idx = Int(round(t_mod / dt)) % N + 1
        return x_t[idx]
    end
end

using CairoMakie

f = rand_signal_bl(10.0, 50.0)  # pasmo od 10 Hz do 50 Hz

t_vals = 0:0.001:1
y_vals = [f(t) for t in t_vals]

# Wykres sygnału
fig = Figure()
Axis(fig[1, 1], title="Pasmowy szum biały (10–50 Hz)", xlabel="t [s]", ylabel="x(t)")
lines!(t_vals, y_vals, color=:blue)
save("rand_signal_bl.png", fig)