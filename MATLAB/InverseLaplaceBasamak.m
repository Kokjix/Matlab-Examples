clc
clear all
syms t s % custom değişken tanımlamak için gerekli komuttur

num = [1 18]; % Transfer fonksiyonun pay kısmı
den = [1 6 60 312];  % Transfer fonksiyonun payda kısmı
G = tf(num,den) % Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

figure(1) %deneme yapılırken grafikleri koymak için gerekli figure komutu birden fazla grafik koymaya yaramakta
step(G,'b') % step fonksiyonu transfer fonksiyonu birim basamak fonksiyonunu çizmek için kullanılır grafik rengi mavidir 'b' argumanı sayesinde
hold on % bir önceki grafiği üstte tutar

%F = (s + 18)/(s*(s+5.45)*((s^2)+0.534*s+57.0738)); %Bu ve bir satır altı inverse laplace fonksiyonu kontrol amaçlı bulunmaktadır matlab'ın kendi ters laplace fonksiyonu şu anda yorum satırındadrı yani işlevi yoktur 
%ilaplace(F)
%T = matlabFunction(ilaplace(F)); %Ters laplace aldıktan sonra plot çizilmesi için bu adım gerekmektedir yorum satırındadır hiç işlevselliği yoktur. işlemleri kontrol ederken kullanılmıştır sadece.
T = 0.05786 - (0.03041.*exp(-0.267*t).*cos(7.5500*t)) - (0.02089.*exp(-0.267*t).*sin(7.5500*t)) - (0.02745 .* exp(-5.45*t)) %Transfer fonksiyonun birim basamak için cevabınn ters laplac'ı
fplot(T,'r') % x koordinatında 0 dan sonsuza çizimler için bu fplot kullanılmıştır plot fonksiyonundan farkı budur. Rengi kırmızıdır 'r' argumanı sayesinde
title('Birim Basamak ve Step') %Grafiğin adı belirtilir.
grid on %grid açılır