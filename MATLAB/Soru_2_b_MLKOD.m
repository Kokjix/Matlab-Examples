clc
clear all

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı

G = tf(num,den)
Kp = 1.75 % P kontrolcü katsayısı


margin(Kp*G)

grid on