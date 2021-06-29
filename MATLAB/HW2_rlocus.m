clc 
clear all %Bu ve üstteki clc beraber kullanılıldığında script çalıştırırken önceki değişkenlei workspaceden siler

s = tf('s'); %laplace değişkeni tanımlama
G = (s+18)/(s^3 + 6*s^2 + 60*s + 312); % Transfer fonksiyonumuz
rlocus (G); %kök yay eğrisini çizdiren fonksiyon
[K,p] = rlocfind(G); % Kök yay eğrisinde nokta şeçmeye yarıyan fonksiyon
grid on