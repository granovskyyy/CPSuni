#zadanie 3.1
fs=1000 
n=256
a=2
f=25
p=pi/4
t0=0.25
t=t0.+(0:n-1)./fs
x=a.*sin.(2*pi.*t.+p)
println(x[1:10])

