clc
clear all

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı
T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

Kp = 1.75; % P değerit
Ki = 5.327; % I değeri
Kd = 0.2069 % D değeri

G = pid(Kp, Ki, Kd); % PID

F =(G*T) % Açık çevrim Fonksiyonu



margin(F)
grid on