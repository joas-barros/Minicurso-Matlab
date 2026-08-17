prompt = 'What is the Temperature in DegC? ';

X = input(prompt);
sim("conversor")

resultado = out.TempF(end);

fprintf('A temperatura calculada no Simulink é: %.2f °F\n', resultado);