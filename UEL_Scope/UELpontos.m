
[UEL,MAP,ALPHA] = imread('logo_uel.png')

J = imresize(UEL, 0.2735);

UEL2D = J(:,:,1);

BW2 = edge(UEL2D, 'canny')

[X,Y] = find(BW2>0.5)

X = abs(X-128)

farq = fopen('tabelaxy.txt', 'w+');
fprintf(farq, '%s\n', 'const uint8_t TabX[] = {');

for ii=1:size(X)
    fprintf(farq, '%3d,',X(ii));
    if(mod(ii,32)==0)
       fprintf(farq, '\n');
    else
       fprintf(farq, ' ');
    end
end

fprintf(farq, '%s\n', '};');

fprintf(farq, '%s\n', 'const uint8_t TabY[] = {');

for ii=1:size(Y)
    fprintf(farq, '%3d,',Y(ii));
    if(mod(ii,32)==0)
       fprintf(farq, '\n');
    else
       fprintf(farq, ' ');
    end
end

fprintf(farq, '%s', '};');
fclose(farq);

plot(Y,X, '.')