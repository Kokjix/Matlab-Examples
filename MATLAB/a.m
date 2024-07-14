clc 
clear all


num = [1 1]; % Transfer fonksiyonun pay kısmı
den = [1 5 6 0]; % Transfer fonksiyonun payda  kısmı

T = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

zeros = roots(num) %sistemin sıfırları
polar = roots(den) %sistemin kutupları

pzmap(T,'r') % pzmap kutupların ve sıfırların reel imajiner düzlemde konumlarını gösteren fonksiyon noktalar daha rahat gözüksün diye kırmızı yapmak için 'r' argümanı girildi fonksiyona
