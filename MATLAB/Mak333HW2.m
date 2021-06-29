clc 
clear all %Bu ve üstteki clc beraber kullanılıldığında script çalıştırırken önceki değişkenlei workspaceden siler

num = [1.75 31.5]; % Transfer fonksiyonun pay kısmı
den = [1 6 61.75 343.5]; % Transfer fonksiyonun payda  kısmı
Kp = 1.75 % P kontrolcü katsayısı
T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

zeros = roots(Kp*num) %sistemin sıfırları
polar = roots(den) %sistemin kutupları
step(T) %P KONTROLCÜLÜ TRANSFER FONKSİYONU BASAMAK CEVABI
stepinfo(T) %P KONTROLCÜLÜ TRANSFER FONKSİYONU BASAMAK CEVABI BİLGİLERİ
%pzmap(T,'r') % pzmap kutupların ve sıfırların reel imajiner düzlemde konumlarını gösteren fonksiyon noktalar daha rahat gözüksün diye kırmızı yapmak için 'r' argümanı girildi fonksiyona
grid on % plotlarda grid2i açan komut rahat gözükmesi için açıltı gridl