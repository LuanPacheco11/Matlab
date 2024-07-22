clear;
close all; 
clc;

X = zeros(5, 5, 10);

X(:, :, 1) = [ 0 0 1 0 0;
               0 1 1 0 0;
               0 0 1 0 0;
               0 0 1 0 0;
               0 1 1 1 0];

X(:, :,2) = [ 1 1 1 1 0;
              0 0 0 0 1;
              0 1 1 1 0;
              1 0 0 0 0;
              1 1 1 1 1];

X(:, :, 3) = [ 1 1 1 1 0;
               0 0 0 0 1;
               0 1 1 1 0;
               0 0 0 0 1;
               1 1 1 1 0];

X(:, :, 4) = [0 0 0 1 0;
              0 0 1 1 0;
              0 1 0 1 0;
              1 1 1 1 1;
              0 0 0 1 0];

X(:, :, 5) = [ 1 1 1 1 1;
               1 0 0 0 0;
               1 1 1 1 0;
               0 0 0 0 1;
               1 1 1 1 0];

X(:, :, 6) = [ 0 1 1 1 0;
               0 1 0 0 0;
               0 1 1 1 0;
               0 1 0 1 0;
               0 1 1 1 0];

X(:, :, 7) = [ 0 1 1 1 0;
               0 0 0 1 0;
               0 0 0 1 0;
               0 0 0 1 0;
               0 0 0 1 0];

X(:, :, 8) = [ 0 1 1 1 0;
               0 1 0 1 0;
               0 1 1 1 0;
               0 1 0 1 0;
               0 1 1 1 0];

X(:, :, 9) = [ 0 1 1 1 1;
               0 1 0 0 1;
               0 1 1 1 1;
               0 0 0 0 1;
               0 0 0 0 1];

X(:, :, 10) = [ 1 1 1 1 1;
                1 0 0 0 1;
                1 0 0 0 1;
                1 0 0 0 1;
                1 1 1 1 1];

D = [ 1 0 0 0 0 0 0 0 0 0;
      0 1 0 0 0 0 0 0 0 0;
      0 0 1 0 0 0 0 0 0 0;
      0 0 0 1 0 0 0 0 0 0;
      0 0 0 0 1 0 0 0 0 0;
      0 0 0 0 0 1 0 0 0 0;
      0 0 0 0 0 0 1 0 0 0;
      0 0 0 0 0 0 0 1 0 0;
      0 0 0 0 0 0 0 0 1 0;
      0 0 0 0 0 0 0 0 0 1;];

%%%%% TRAINING NN %%%%%%%
M =1:10; rng(3);
W1 = 2*rand(50, 25) - 1;
W2 = 2*rand(10, 50) - 1;

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
width=5;

subplot(2,5,1)
spy(X(:, :, 1))
title("Alphabet: 1")

subplot(2,5,2)
spy(X(:, :, 2))
title("Alphabet: 2")

subplot(2,5,3)
spy(X(:, :, 3))
title("Alphabet: 3")

subplot(2,5,4)
spy(X(:, :, 4))
title("Alphabet: 4")

subplot(2,5,5)
spy(X(:, :, 5))
title("Alphabet: 5")

subplot(2,5,6)
spy(X(:, :, 6))
title("Alphabet: 6")

subplot(2,5,7)
spy(X(:, :, 7))
title("Alphabet: 7")

subplot(2,5,8)
spy(X(:, :, 8))
title("Alphabet: 8")

subplot(2,5,9)
spy(X(:, :, 9))
title("Alphabet: 9")

subplot(2,5,10)
spy(X(:, :, 10))
title("Alphabet: 0")

%%%%%%%% TEST / INFERENCE %%%%%%%%%%%%
N = 10; %symbols
%%%% IMPERFECT Symbols or OUT of alphabet

Xop(:, :, 1) = [ 0 1 1 0 0;
                 1 1 1 0 0;
                 0 0 1 0 0;
                 0 0 1 0 0;
                 1 1 1 1 0];

Xop(:, :, 2) = [ 0 1 1 1 0;
                 0 0 0 0 1;
                 0 0 1 1 0;
                 1 0 0 0 0;
                 1 1 1 1 1];

Xop(:, :, 3) = [ 0 1 1 1 1;
                 0 0 0 0 1;
                 0 1 1 1 1;
                 0 0 0 0 1;
                 0 1 1 1 1];

% out of alphabet
Xop(:, :, 4) = [0 0 0 0 1;
                0 0 1 0 1;
                0 1 0 0 1;
                1 1 1 1 1;
                0 0 0 0 1];



% out of alphabet
Xop(:, :, 5) = [0 1 1 1 1;
                1 0 0 0 0;
                1 1 1 1 0;
                0 0 0 0 1;
                0 0 1 1 1];

% out of alphabet
Xop(:, :, 6) = [0 1 1 1 1;
                0 1 0 0 0;
                0 1 1 1 0;
                0 1 0 1 0;
                0 1 1 1 0];

Xop(:, :, 7) = [ 0 1 1 1 0;
                 0 0 0 1 0;
                 0 0 0 1 1;
                 0 0 0 1 1;
                 0 0 0 0 1];

Xop(:, :, 8) = [ 0 1 1 1 1;
                 0 1 0 1 1;
                 0 1 1 1 0;
                 0 1 0 1 0;
                 0 1 1 1 0];

Xop(:, :, 9) = [ 0 0 1 1 0;
                 0 0 1 0 1;
                 0 0 1 1 1;
                 0 0 0 0 1;
                 0 0 0 0 1];

Xop(:, :, 10) = [ 1 1 1 1 1;
                  1 0 0 0 1;
                  1 1 0 0 1;
                  1 0 0 0 0;
                  1 1 1 1 1];

%%%% PLot of Tested Symbols %%%%%
figure(3)
subplot(2,5,1)
spy(Xop(:, :, 1))
title("Test 1: symb. unkown")
subplot(2,5,2)
spy(Xop(:, :, 2))
title("Test 2: symb. unkown")
subplot(2,5,3)
spy(Xop(:, :, 3))
title("Test 3: symb. unkown")
subplot(2,5,4)
spy(Xop(:, :, 4))
title("Test 4: symb. unkown")
subplot(2,5,5)
spy(Xop(:, :, 5))
title("Test 5: symb. unkown")
subplot(2,5,6)
spy(Xop(:, :, 6))
title("Test 6: symb. unkown")
subplot(2,5,7)
spy(Xop(:, :, 7))
title("Test 7: symb. unkown")
subplot(2,5,8)
spy(Xop(:, :, 8))
title("Test 8 : symb. unkown")
subplot(2,5,9)
spy(Xop(:, :, 9))
title("Test 9 : symb. unkown")
subplot(2,5,10)
spy(Xop(:, :, 10))
title("Test 10 : symb. unkown")

%%%%%% inference %%%%%%%
for k = 1:N
    x = reshape(Xop(:, :, k), 25, 1);
    v1 = W1*x;
    y1 = sigmoid(v1);
    v = W2*y1;
    v = extractdata(v);
    y(:,k) = softmax(v);
end

figure(4)
bar3(y)
xlabel("Test #")
ylabel("Symbol infered: 1 to 5 and 0")
zlabel("Inference level")

function [W1, W2, e] = MultiClass(W1, W2, X, D)
    alpha = 0.9;
    N = 10;
    for k = 1:N
        x = reshape(X(:,:,k), 25, 1);
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

