clear;
close all; 
clc;

numrow = 40;
numcol = 40;
imgs = 25;
X = zeros(numrow, numcol, imgs);

cd Treinamento
imagefiles = dir('*.jpg');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   X(:,:,ii) = funcao_ler_imagem(currentfilename, numrow, numcol);
end
cd ..

% D = [1 0 0 0 0;
%      0 1 0 0 0;
%      0 0 1 0 0;
%      0 0 0 1 0;
%      0 0 0 0 1 ];

D = [ 1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0;
      1 0 0 0 0;
      0 1 0 0 0;
      0 1 0 0 0;
      0 1 0 0 0;
      0 1 0 0 0;
      0 1 0 0 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 0 1 0 0;
      0 0 0 1 0;
      0 0 0 1 0;
      0 0 0 1 0;
      0 0 0 1 0;
      0 0 0 1 0
      0 0 0 0 1;
      0 0 0 0 1;
      0 0 0 0 1;
      0 0 0 0 1;
      0 0 0 0 1];

%%%%% TRAINING NN %%%%%%%
fact = 5;
M  = 1:fact; rng(3);
W1 = 2*rand(5*fact, numrow*numcol) - 1;
W2 = 2*rand(5, 5*fact) - 1;
for i=1:length(M)
    epoch(i) = factorial(M(i));
    % --- training NN for each epoch size ----
    for j=1:epoch
        [W1, W2, Er] = MultiClass(W1, W2, X, D);
    end
    avgEr(i) = mean(abs(Er),1);
end

MM = factorial(M);
figure(1)
loglog(MM, avgEr)
xlabel("Epoch")
ylabel("avg. |Error|")
grid on

%%%% Alphabet Plot %%%%%
figure(2)
width=25;
for k = 1:imgs
    subplot(5,5,k)
    spy(X(:, :, k))
end

%%%%%%%% TEST / INFERENCE %%%%%%%%%%%%
N = 5; %symbols
%%%% IMPERFECT Symbols or OUT of alphabet

cd Validacao
imagefiles = dir('*.jpg');      
nfiles = length(imagefiles);    % Number of files found
for ii=1:nfiles
   currentfilename = imagefiles(ii).name;
   Xop(:,:,ii) = funcao_ler_imagem(currentfilename, numrow, numcol);
end
cd ..

%%%% PLot of Tested Symbols %%%%%
figure(3)
width=25;
for k = 1:N
    subplot(2,3,k)
    spy(Xop(:, :, k))
    title(sprintf('Test %d: symb. unkown', k))
end

%%%%%% inference %%%%%%%
for k = 1:N
    x = reshape(Xop(:, :, k), 40*40, 1);
    v1 = W1*x;
    v1 = dlarray(v1);
    y1 = sigmoid(v1);
    v = W2*y1;
    v = extractdata(v);
    y(:,k) = softmax(v);
end

figure(4)
bar3(y)
xlabel("Test #")
ylabel("Symbol infered: 1 to 5")
zlabel("Inference level")

function [W1, W2, e] = MultiClass(W1, W2, X, D)
    alpha = 0.9;
    N = 25;
    for k = 1:N
        x = reshape(X(:, :, k), 40*40, 1);
        d = D(k, :)';
        v1 = W1*x;
        v1 = dlarray(v1);
        y1 = sigmoid(v1);
        v = W2*y1;
        v = extractdata(v);
        y = softmax(v);
        e = d - y;
        delta = e;
        e1 = W2'*delta;
        delta1 = y1.*(1-y1).*e1;
        dW1 = alpha*delta1*x';
        W1 = W1 + dW1;
        dW2 = alpha*delta*y1';
        W2 = W2 + dW2;
    end
end

function imagem = funcao_ler_imagem(name, numrow, numcol)
    img = imread(name);
    img =255-img;
    img = im2double(img);
    J = imresize(img, [numrow, numcol]);
    J = rgb2gray(J);
    J = imbinarize(J);
    imagem = J;
    
end