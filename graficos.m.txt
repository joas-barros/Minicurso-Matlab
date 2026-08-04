    % Definindo os vetores de dados
x = [0:2:22];                     % Vetor de 0 a 22 com passo 2 (12 elementos)
y = [9 8 6 5 8 10 14 17 15 13 11 10]; % Dados correspondentes a x

w = [22:2:44];                    % Vetor de 22 a 44 com passo 2 (12 elementos)
z = [18 16 12 10 16 20 28 34 30 26 22 20]; % Dados para w

l = [44:2:66];                    % Vetor de 44 a 66 com passo 2 (12 elementos)
m = [27 24 18 15 24 30 42 51 45 39 33 30]; % Dados para l

% Plotando um gráfico de linha simples
plot(x, y);

figure                            % Cria uma nova janela de figura
bar(x, y)                         % Gráfico de barras para x e y
hold on                            % Mantém o gráfico atual para sobrepor outros plots
plot(x, y)                         % Sobrepõe uma linha sobre as barras
plot(w, z)                         % Adiciona outra linha com os vetores w e z
plot(l, m)                         % Adiciona mais uma linha com os vetores l e m
hold off                           % Libera o hold (não sobrepõe mais)
    
subplot(2, 2, 2)                   % Divide a janela em uma grade 2x2, seleciona a posição 2
plot(x, y)                         % Plota os dados
title('Temperatura')               % Adiciona título ao gráfico

subplot(2, 2, 3)                   % Seleciona a posição 3 na grade 2x2
plot(x, w)                         % Plota x versus w
title('Velocidade do Vento')       % Título do gráfico


t = 0:0.1:5*pi;                    % Vetor t de 0 a 5*pi com incremento 0.1
plot3(sin(t), cos(t), t)           % Gráfico 3D da curva (espiral)
xlabel("x")                        % Rótulo eixo x
ylabel("y")                        % Rótulo eixo y
zlabel("z")                        % Rótulo eixo z
grid                                % Adiciona grade ao gráfico


% Calculando valores para uma superfície z = sqrt(abs(1 - x^2 - y^2))
i = 1;
for x = -0.5:0.1:0.5
    j = 1;
    for y = -0.5:0.1:0.5
        z(i, j) = sqrt(abs(1 - x.^2 - y.^2)); % Calcula z para cada combinação de x e y
        j = j + 1;
    end
    i = i + 1;
end

mesh(z)                             % Exibe a superfície em malha
title('Grafico 3D')                 % Título do gráfico


[xdom, ydom] = meshgrid(-0.5:0.1:0.5, -0.5:0.1:0.5); % Cria uma grade de pontos
z = sqrt(abs(1 - xdom.^2 - ydom.^2));                % Calcula os valores z
mesh(z)                                              % Exibe em malha 3D

mesh(z, [ -37.5, 0]) % Ângulo de vista de uma elevação horizontal 

x = -8:0.6:8;                       % Vetor de -8 a 8 com passo 0.6
y = -8:0.6:8;                       % Mesmo vetor para y
[X, Y] = meshgrid(x, y);            % Cria uma grade 2D

Z = sqrt(X.^2 + Y.^2) + eps;        % Calcula a distância da origem + eps (evita divisão por zero)
Z = sin(Z)./Z;                      % Função senoidal dividida pela distância (Sinc 2D)

surf(Z)                              % Gera uma superfície colorida e suave 
view(45,30)

% -----------------------------
% MODELO 3D DE VIBRAÇÃO DE UM DISCO
% -----------------------------

% Parâmetros do modelo
A = 0.05;      % Amplitude da vibração (metros)
n = 3;         % Número de nodos radiais (modo de vibração)

% Criando a malha em coordenadas cartesianas (x e y)
% O disco será representado em uma grade quadrada de -1 a 1
[x, y] = meshgrid(linspace(-1, 1, 200), linspace(-1, 1, 200));

% Calculando a distância radial a partir do centro (r = sqrt(x² + y²))
r = sqrt(x.^2 + y.^2);

% Máscara para limitar os pontos apenas dentro do disco (r <= 1)
% Isso impede que a função apareça fora da área circular
mask = r <= 1;

% Aplicando a função de vibração (modo radial simples)
% Onde Z recebe a deformação apenas nos pontos dentro do disco
z = zeros(size(r));                    % Inicializa matriz Z com zeros
z(mask) = A * sin(n * pi * r(mask));  % Aplica função de vibração onde r <= 1

% -----------------------------
% Gráfico 3D da vibração
% -----------------------------
figure
surf(x, y, z)               % Gera o gráfico de superfície
xlabel('x (m)')
ylabel('y (m)')
zlabel('Deformação (m)')
title(['Modo de Vibração Radial n = ', num2str(n)])
colorbar                    % Adiciona barra de cores para amplitude
shading interp              % Suaviza a superfície (interpolação visual)
axis equal                  % Escala igual nos eixos para manter proporção
grid on
