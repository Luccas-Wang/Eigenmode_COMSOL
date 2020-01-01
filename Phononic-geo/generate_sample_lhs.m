function X_scaled = generate_sample_lhs(num_smp, x_n,y_n,p)
[X_scaled,~]=lhsdesign_modified(num_smp, zeros(1,x_n*y_n),ones(1,x_n*y_n));
X_scaled(X_scaled<p) = 0;
X_scaled(X_scaled>=p) = 1;
end