%Inclass 20
%GB comments
1 100
2 100
3 100
4. 100
Overall 100


%In this folder you will find a .mat file with x and y data

mat = load('data.mat');

mat_t = zeros(101,2);
mat_t(:,1) = mat.xx;
mat_t(:,2) = mat.yy;


% For all of the questions below, use any options as necessary to get a
% good fit - starting points, lower bounds etc. 

% 1. Define a custom model and try to fit the data to a Michaelis function 
% y = V*x/(K+x). 

fit_mich = '(V*x)/(K+x)';
mich_model = fittype(fit_mich);
[fit_out_mich, fit_metric_mich] = fit(mat_t(:,1), mat_t(:,2), mich_model)
plot(fit_out_mich, mat_t(:,1), mat_t(:,2));


% 2. Use a custom model to try to fit the data to a Hill function with
% exponent 2: y = V*x^2/(K^2+x^2)

hill_form = 'V*x^2/(K^2+x^2)';
hill_m = fittype(hill_form);
[hillf_out, hillmetric] = fit(mat_t(:,1), mat_t(:,2), hill_m)
plot(hillf_out, mat_t(:,1), mat_t(:,2));

% 3. Now treat the exponent as a free parameter and perform the fit again,
% that is fit to the model y = V*x^n/(K^n+x^n)

p3f = 'V*x^n/(K^n+x^n)';
p3m = fittype(p3f);
[p3_out, p3metric] = fit(mat_t(:,1), mat_t(:,2), p3m, 'StartPoint', [1 7 2])
plot(p3_out, mat_t(:,1), mat_t(:,2));

% 4. Redo parts 1 and 2, but using your model from 3 and fixing the value of
% n to either 1 or 2.

%      K =       1.622  (1.538, 1.707)
%      V =       3.033  (2.984, 3.081)

fit_michp41 = 'V*x^n/(K^n+x^n)';
mich_modelp41 = fittype(fit_michp41, 'problem', 'n');
[fit_out_michp41, fit_metric_michp41] = fit(mat_t(:,1), mat_t(:,2), mich_modelp41, 'problem', 1)
plot(fit_out_michp41, mat_t(:,1), mat_t(:,2));

fit_michp42 = 'V*x^n/(K^n+x^n)';
mich_modelp42 = fittype(fit_michp42, 'problem', 'n');
[fit_out_michp42, fit_metric_michp42] = fit(mat_t(:,1), mat_t(:,2), mich_modelp42, 'problem', 2)
plot(fit_out_michp42, mat_t(:,1), mat_t(:,2));
