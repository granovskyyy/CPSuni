fs=2048
n=256
a=0.25
f=pi/2
p=pi
t0=5
tend=10

t=t0:(1/fs):tend
t=t[1:end-1]
x = a * exp.(1im * (2π * f .* t .+ p))

println(x[1:10])