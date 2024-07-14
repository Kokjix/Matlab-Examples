clc
clear all
syms t s % custom değişken tanımlamak için gerekli komuttur

num = [1 18];  % Transfer fonksiyonun pay kısmı
den = [1 6 60 312]; % Transfer fonksiyonun payda  kısmı
G = tf(num,den)% Transfer fonksiyonu oluşturan tf fonksiyonu bunda ; yok çünkü terminalde görmek istiyorum transfer fonksiyonunu

figure(1) %deneme yapılırken grafikleri koymak için gerekli figure komutu birden fazla grafik koymaya yaramakta
impulse(G,'b')% impulse fonksiyonu transfer fonksiyonu birim darbe fonksiyonunu çizmek için kullanılır grafik rengi mavidir 'b' argumanı sayesinde
hold on % bir önceki grafiği üstte tutar



T = (-0.14964.*exp(-0.267*t).*cos(7.5500*t)) + (0.23517.*exp(-0.267*t).*sin(7.55000*t)) + (0.14964.*exp(-5.45*t)) % Transfer fonksiyonun birim darbe için cevabınn ters laplac'ı
%F = (s + 18)/((s+5.45)*((s^2)+0.534*s+57.0738)); %Burası kontrol amaçlı eklenmiştir matlab ters laplace fonksiyonu ancak hiç bir işlevselliği yoktur zten yorum satırındadır. 
%ilaplace(F) % bir önceki satır gibi kontrol amaçlı eklenmiştir

%T = matlabFunction(ilaplace(F)); %Ters laplace aldıktan sonra plot çizilmesi için bu adım gerekmektedir yorum satırındadır hiç işlevselliği yoktur. işlemleri kontrol ederken kullanılmıştır sadece.
fplot(T,'r') % x koordinatında 0 dan sonsuza çizimler için bu fplot kullanılmıştır plot fonksiyonundan farkı budur. Rengi kırmızıdır 'r' argumanı sayesinde
title('Birim Darbe ve Impulse') %Grafiğin adı belirtilir.
grid on %grid açılır
