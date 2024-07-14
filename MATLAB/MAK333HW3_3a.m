clc 
clear all %Bu ve üstteki clc beraber kullanılıldığında script çalıştırırken önceki değişkenlei workspaceden siler

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı

T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

bode(T)
margin(T)
[Gm,Pm,Wgm,Wpm] = margin(T)
bandwidth(T)

grid on