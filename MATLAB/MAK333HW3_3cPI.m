clc 
clear all %Bu ve üstteki clc beraber kullanılıldığında script çalıştırırken önceki değişkenlei workspaceden siler

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı
T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

Kp = 1.575; % P değeri
Ki = 2.397; % I değeri
Kd = 0;

G1 = pid(Kp, Ki, Kd); % PID

F = G1*T %feedback(G1*T,1) % Kapalı çevrim Fonksiyonu

bode(F)
margin(F)
%bandwidth(F)

grid on
