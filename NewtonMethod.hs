module NewtonMethod where

{-
  Método de Newton-Raphson
    x0 = palpite inicial
    x[n+1] = x[n] - (f(x[n])/f'(x[n]))
-}

-- # Calcula o valor da próxima iteração segundo o método de Newton-Raphson
next f f' xn = xn - ((f xn) / (f' xn))

-- # Calcula indefinidamente o valor da raiz da função
newton f f' x0 = iterate next x0
  where next xn = xn - ((f xn) / (f' xn))

-- # Calcula o valor da raiz da função (limitando o número de iterações e exibindo o resultado de todas as iterações)
newtonIt f f' x0 it = zip [1..it] (newton f f' x0)

-- # Calcula o valor da raiz da função (limitando o número de iterações e exibindo apenas o resultado da última iteração)
newtonItFinalValue f f' x0 it = snd (last (newtonIt f f' x0 it))

{-
  # Encontrando funções para o cálculo do método de Newton para n-ésima raiz:
  => Ex.: Raiz quadrada de 56:
     x ^ 2 = 56
	 (x ^ 2) - 56 = 0
	 f(x) = (x ^ 2) - 56

	 Achando a derivada:
	 f'(x) = 2x

	 Temos, então:
	 f(x)  = (x ^ 2) - 56
	 f'(x) = 2x

  Generalizando para n-ésima raiz:
     x ^ nth = number
	 f(x)  = x ^ nth - number
	 f'(x) = nth * x * (nth - 1) //Aplicação da "regra do tombo"
-}

-- # Calcula o valor da n-ésima raiz de um número (limitando o número de iterações)
nthRootIt nth number it = newtonIt (\x -> x ** nth - number) (\x -> (nth) * x * (nth - 1)) 1 it
-- # Calcula o valor da n-ésima raiz de um número (limitando o número de iterações e exibindo apenas o resultado da última iteração)
nthRootItFinalValue nth number it = newtonItFinalValue (\x -> x ** nth - number) (\x -> (nth) * x * (nth - 1)) 1 it

-- # Obs.: Adotamos, acima, sempre o valor 1 como palpite inicial.
