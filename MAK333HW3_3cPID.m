clc 
clear all %Bu ve üstteki clc beraber kullanılıldığında script çalıştırırken önceki değişkenlei workspaceden siler

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı
T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

Kp = 2.1; % P değeri
Ki = 5.327; % I değeri
Kd = 0.2069; % D değeri

G1 = pid(Kp, Ki, Kd); % PID
G2 = pid(1.75,0,0); %P kontrolcüsü pid değeri

Tp = feedback(G2*T,1) %Sadece P kontrolcülü kapalı çevrim sistem
F = feedback(G1*T,1) % Kapalı çevrim Fonksiyonu


step(F,'g') %birim basamak cevap pid
hold on
step(T,'r') %birim basamak cevap açık çevrim
hold on
step(Tp,'b') %birim basamak cevap p kontrolcu

PID = bandwidth(F)% PID bant genişliği
O = bandwidth(T) % Açık çevrim bant genişliği
P = bandwidth(Tp) % P kontrolcülü bant genişliği

grid on
