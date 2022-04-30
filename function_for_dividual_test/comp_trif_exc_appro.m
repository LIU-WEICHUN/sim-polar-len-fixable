x= 11:0.01:100;
x_log = -5:0.01:-0.5;
x = 10.^x_log;
y_ex = [];
for i = x
    y_ex =[y_ex, TrifinovFormula(i, false)];
end
y_appr = TrifinovFormula(x, true);

y_new = newapproxTrifinovFormula(x);
y_new_new = newnewapproxTrifinovFormula(x)
% plot(x, y_ex,'-*');
% hold on;
% plot(x, y_appr,'-o')
plot(x, y_ex,'-');
hold on;
plot(x, y_appr,'--')
hold on;
plot(x, y_new,'-o')
hold on;
plot(x, y_new,'-s')


legend(...
'Trifinov exact', 'approximation []','adjust approximation' ...
)