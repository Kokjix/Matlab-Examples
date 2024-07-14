clc 
clear all %Bu ve üstteki clc beraber kullanılıldığında script çalıştırırken önceki değişkenlei workspaceden siler

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı
T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

Kp = 1.75 %2.1; % P değeri
Ki = 0 %5.327; % I değeri
Kd = 0 %0.2069 % D değeri

G1 = pid(Kp, Ki, Kd); % PID

F = feedback(G1*T,1) % Kapalı çevrim Fonksiyonu

%zeros = roots(Kp*num) %sistemin sıfırları
%polar = roots(den) %sistemin kutupları
step(F,'r') %Kapalı çevrim Basamak cevabı grafiği 
stepinfo(F) %Kapalı çevrim Basamak cevabı bilgileri
%pzmap(T,'r') % pzmap kutupların ve sıfırların reel imajiner düzlemde konumlarını gösteren fonksiyon noktalar daha rahat gözüksün diye kırmızı yapmak için 'r' argümanı girildi fonksiyona
grid on % plotlarda grid2i açan komut rahat gözükmesi için açıltı gridl