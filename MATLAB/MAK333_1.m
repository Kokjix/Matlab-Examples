clc 
clear all %Bu ve üstteki clc beraber kullanılıldığında script çalıştırırken önceki değişkenlei workspaceden siler

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı

T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

zeros = roots(num) %sistemin sıfırları
polar = roots(den) %sistemin kutupları

pzmap(T,'r') % pzmap kutupların ve sıfırların reel imajiner düzlemde konumlarını gösteren fonksiyon noktalar daha rahat gözüksün diye kırmızı yapmak için 'r' argümanı girildi fonksiyona
grid on % plotlarda grid2i açan komut rahat gözükmesi için açıltı gridler