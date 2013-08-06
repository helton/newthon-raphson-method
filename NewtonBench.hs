import Criterion.Main
import NewtonMethod

squareRoot_It_100    n = nthRootItFinalValue 2.0 n 100.0
cubeRoot_It_100      n = nthRootItFinalValue 3.0 n 100.0
squareRoot_It_1000   n = nthRootItFinalValue 2.0 n 1000.0
cubeRoot_It_1000     n = nthRootItFinalValue 3.0 n 1000.0
squareRoot_It_10000  n = nthRootItFinalValue 2.0 n 100000.0
cubeRoot_It_10000    n = nthRootItFinalValue 3.0 n 100000.0
squareRoot_It_20000  n = nthRootItFinalValue 2.0 n 200000.0
cubeRoot_It_20000    n = nthRootItFinalValue 3.0 n 200000.0

main = 
  defaultMain 
	[
		bgroup "100 iterações" [
			bench "Raiz quadrada de 2" $ whnf squareRoot_It_100 2.0,
			bench "Raiz cúbica de 2"   $ whnf cubeRoot_It_100 2.0],
		bgroup "1.000 iterações" [
			bench "Raiz quadrada de 2" $ whnf squareRoot_It_1000 2.0,
			bench "Raiz cúbica de 2"   $ whnf cubeRoot_It_1000 2.0],
		bgroup "10.000 iterações" [
			bench "Raiz quadrada de 2" $ whnf squareRoot_It_10000 2.0,
			bench "Raiz cúbica de 2"   $ whnf cubeRoot_It_10000 2.0],
		bgroup "20.000 iterações" [	
			bench "Raiz quadrada de 2" $ whnf squareRoot_It_20000 2.0,
			bench "Raiz cúbica de 2"   $ whnf cubeRoot_It_20000 2.0]
	]
