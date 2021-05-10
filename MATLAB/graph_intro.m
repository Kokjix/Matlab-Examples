clc
clear all

t = 0:0.01:25;

y= sin(2*pi*t);

plot(t,y,'r')

title('Harmonik Sinyal')
xlabel('zaman')
ylabel('genlik')

hold on 
z = cos(2*pi*t);

plot(t,z,'b')

legend('y','z')