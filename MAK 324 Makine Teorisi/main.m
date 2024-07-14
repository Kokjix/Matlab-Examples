clear;
close all;
global m AB BD AG GF FD BC CE GE teta12 a3 a6 teta13 teta14 teta15 teta16 w12 w13 w14 w15 w16;

% Author: Baran Berk Bagci

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Konum Analizi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 96;
fprintf('Konum Analizi:')
teta12=m*pi/180;
a3 = 37.63 *pi/180;
a6 = 24.06*pi/180;

AG=41; AB=15; BC=25; BD=15; FD=35; CE=40; GE=50; GF=35;

% order: [teta13 teta14 teta15 teta16]
x0 = [1 1 1 1];

solution=(fsolve (@pos, x0));

% teta12 = 96 derece için çözümler
teta13 = solution(1);
teta14 = solution(2);
teta15 = solution(3);
teta16 = solution(4); 

% teta12 = 0-360 için teta16 konum analizi grafiği
for i=1:1:360
    teta12v(i)=i*pi/180;  %radyan cinsinden
    teta12=teta12v(i);
    x0=[130 120 -50 200]; %başlangıç koşulu veriyoruz.
    % sıra: [teta13 teta14 teta15 teta16]
    a3 = 37.63 *pi/180;
    a6 = 24.06*pi/180;
    sl=(fsolve (@pos, x0));
    teta13v(i)=sl(1);
    teta14v(i)=sl(2);
    teta15v(i)=sl(3);
    teta16v(i)=sl(4);
end
plot(teta12v*180/pi, wrapTo360(teta16v*180/pi),'bo')
hold on
title('Konum grafigi')
xlabel('teta12')
ylabel('teta16')
legend('teta16')
grid on

fprintf('teta13 (derece): %f',teta13*180/pi);
fprintf(' teta14 (derece): %f',teta14*180/pi);
fprintf(' teta15 (derece): %f',teta15*180/pi);
fprintf(' teta16 (derece): %f',teta16*180/pi);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Hız Analizi
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
m = 96;
fprintf('Hiz Analizi:')

w12 = m*0.01;

fprintf('Konum Analizi:')
teta12=45*pi/180;
a3 = 37.63 *pi/180;
a6 = 24.06*pi/180;

AG=41; AB=15; BC=25; BD=15; FD=35; CE=40; GE=50; GF=35;

% order: [teta13 teta14 teta15 teta16]
x0 = [1 1 1 1];

solution=(fsolve (@pos, x0));

% teta12 = 45 derece w12 = 0.96 rad/sn için
teta13 = solution(1);
teta14 = solution(2);
teta15 = solution(3);
teta16 = solution(4);

fprintf('Hız Analizi:')
x1 = [1 1 1 1];
solution_vel = ( fsolve (@vel, x1));
w13 = solution_vel(1);
w14 = solution_vel(2);
w15 = solution_vel(3);
w16 = solution_vel(4);

fprintf('w13: %f rad/s',w13);
fprintf(' w14: %f rad/s ',w14);
fprintf( 'w15: %f rad/s ',w15);
fprintf(' w16: %f rad/s ',w16);

% teta12 = 0-360 için w16 hız analizi grafiği
for i=1:1:360
    teta12v(i)=i*pi/180;  %radyan cinsinden
    w12=0.01*m;
    teta12=teta12v(i);
    x1=[1 1 1 1]; %başlangıç koşulu veriyoruz.

    vsl=(fsolve (@vel, x1));
    w13v(i)=vsl(1);
    w14v(i)=vsl(2);
    w15v(i)=vsl(3);
    w16v(i)=vsl(4);
end
figure
plot(teta12v*180/pi, w16v,'bo')
hold on
title('Hız grafigi')
xlabel('teta2')
ylabel('w16v')
legend('w16v')
grid on
