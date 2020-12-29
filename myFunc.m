function F = myFunc(x,f)
	n = length(x);
	F = zeros(n,n);
	F(:,1) = f;
	for i=1:n-1
		for j=1:i
			F(i+1, j+1) = (F(i+1,j)-F(i,j))/(x(i+1)-x(i+1-j));
		end
	end
end