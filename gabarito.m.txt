% Exemplos criados para o minicurso de matlab

%%

% Estruturas condicionais

% 1 Crie um programa que recebe um número inteiro e retorne se o número é impar ou par.

x = input("Digite um número inteiro: ");

if rem(x, 2) == 0
    disp("O número é par")
else
    disp("O número é impar")
end

%%

% 2 Solicite dois números e mostre qual deles é o maior ou se são iguais.

a = input("Digite um número inteiro: ");
b = input("Digite outro número inteiro: ");

if a > b 
    disp(num2str(a) + " é maior que " + num2str(b))
elseif b > a
        disp(num2str(b) + " é maior que " + num2str(a))
else
    disp("valores iguais")
end

%%
clc

% 3 - Peça três comprimentos de lados e verifique se formam um triângulo.

lado1 = input("Digite o primeiro lado: ");
lado2 = input("Digite o segundo lado: ");
lado3 = input("Digite o terceiro lado: ");

if (lado1 < (lado2 + lado3) && lado2 < (lado3 + lado1) && lado3 < (lado2 + lado1))
    disp("Exite um triangulo");
else
    disp("Não existe um triangulo");
end

%%

% 4 - Solicite um ano e determine se ele é bissexto. (Regra: múltiplo de 4)
clc

ano = input("Que ano é hoje");

if (rem(ano, 4) == 0)
    disp("O ano é bissexto")
else
    disp("Fevereiro tem os dias normais")
end

%%

% 5 - Peça para o usuario o número de Reynolds e classifique o escoamento como laminar (Re < 2000), Transicional (2000 <=Re <= 4000) e turbulento Re > 4000.

clc
reynoalds = input("Informe o numero de reynoalds do fluido: ");

if reynoalds < 2000
    disp("O fluido está em escoamento laminar")
elseif reynoalds >= 2000 && reynoalds <= 4000
    disp("O fluido está em escoamento estacionario")
else
    disp("O fluido está em escoamento turbulento")
end

%%

% 6 - Crie um programa que receba uma força axial aplicada em uma barra e classifique essa força como de compressão ou tração. Dica: (F > 0  indica tração e F < 0 indica compressão)

clc
forca = input("Informe uma força: ");

if (forca > 0)
    disp("A forca é de tracao")
else
    disp("A forca é de compressão")
end

%%

% Estruturas de repetição

% 1 - Peça ao usuário um número inteiro N e calcule a soma dos N primeiros números naturais usando um loop..
clc

n = input("Digite um número inteiro: ");

i = 1;
soma = 0;

while( i <= n)
    i = i + 1;
    soma = soma + i;
end

disp("A soma dos " + num2str(n) + " primeiros nuúmeros é " + num2str(soma));

%%

% 2 - Solicite um número inteiro N e calcule seu fatorial usando for ou while.
clc

n = input("Digite um número inteiro: ");

f = 1;

for i=1:n
    f = f * i;
end

disp(num2str(n) + "! = " + num2str(f))

%%
% 3 - Faça um programa que atribua um valor a uma variável e peça para o usuário adivinhar o valor dela. Mostre uma mensagem caso o input seja maior, menor ou igual ao valor da variável.
clc

teste = 10;

n = input("Adivinhe o número: ");

tentativas = 1;

while(n ~= teste)
    n = input("ERRO!!!! Tente novamente");
    tentativas = tentativas + 1;
end

disp("PARABENS, foram " + num2str(tentativas) + " tentativas");

%%

% 4 - Faça um programa que peça uma nota, entre zero e dez. Mostre uma mensagem caso o valor seja inválido e continue pedindo até que o usuário informe um valor válido.

clc

n = input("Me passe uma nota ");
tentativas = 1;

while(n < 0 || n > 10)
    n = input("Intervalo incorreto, por favor tente de novo");
    tentativas = tentativas + 1;
end

disp(num2str(tentativas) + " tentativas")

%%
% 5 - Peça ao usuário o valor de uma tensão e de vários resistores conectados em série. Use um laço para calcular e exibir a corrente total no circuito, aplicando a Lei de Ohm. O programa termina quando o usuário digitar um resistor igual a zero.

tensao = 200;

conta = 0;
resisTotal = 0;
resis = input("Resistor[" + num2str(conta) + "]: ");
while resis ~= 0
    conta = conta + 1;
    resisTotal = resisTotal + resis;
    resis = input("Resistor[" + num2str(conta) + "]: ");
end

iTot = resisTotal / tensao;

disp("Corrente total = " + num2str(iTot) + " A");


%% MATRIZES

% Criar um vetor de uma linha usando cochetes
vetor = [1 2 3]

% Cria um vetor de uma coluna usando colchete
vetor = [1; 2; 3]

% Crie um vetor de uma coluna usando a transposta de uma linha
vetor = [1 2 3]'

% Crie uma matriz 2x5
matriz = [1 2 3 4 5; 1 2 3 4 5]

% Crie um vetor de uma linha com apenas o numero 1 
vetor = [1 1 1 1 1 1 1]

vetor = ones(1, 3)

% Crie uma coluna de vetores com todos com o mesmo valor
% use o valor de pi
vetor = ones(3, 1) * pi
vetor = ones(3, 1) * 0 + pi

% Crie uma matriz e numeros aleatorios
matriz = rand(3)

% Calcule  transposta dessa matriz e guarde ela em uma nova matriz
matrizNova = matriz'

% Crie uma matriz quadrada
A = [1 2; 0 3];

% Calcule a inversa 
InvA = A^(-1);
InA = inv(A);

% Multiplique a matriz pela sua inversa
I = A * InvA;

% Calcule os autovalores e autovetores
[AutVetor, AutoValor] = eig(A);

% 1 - Crie uma matriz quadrada de ordem N x N constante utilizando como base uma matriz só com 0s e outra só com 1s 

N = 5; % Exemplo de ordem
matrizZeros = zeros(N);
matrizUns = ones(N);

% 2 - Crie uma matriz quadrada de ordem qualquer e percorra os elementos de sua diagonal utilizando um laço For

N = 4; % Exemplo
A = randi(10, N); % Matriz aleatória
disp('Diagonal principal:');
for i = 1:N
    disp(A(i, i));
end

% 3 - Crie uma matriz quadrada de ordem qualquer e multiplique pela sua inversa

N = 3;
A = rand(N); % Matriz aleatória
Ainv = inv(A); % Inversa da matriz
resultado = A * Ainv; % Deve resultar na matriz identidade
disp(resultado);

% 4 - Dada uma matriz 3x3 qualquer, escreva um script que verifique se ela é simétrica (ou seja, se é igual à sua transposta).

A = randi(10, 3); % Matriz 3x3 aleatória
if isequal(A, A.')
    disp('A matriz é simétrica.');
else
    disp('A matriz NÃO é simétrica.');
end

% 5 - 

N = 4;
A = randi([1, 100], N, N);

% Transpostas
transposta = A.';

% Traço (soma dos elementos da diagonal principal)
traco = trace(A);

%  Determinante (se possível)

determinante = det(A);

% Soma da diagonal secundária

somaDiagonalSecundaria = sum(diag(flip(A, 2)));

