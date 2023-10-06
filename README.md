# Functional programming. Assignment # 1, Euler Project.

Вариант: 1, 30.


Цель: освоить базовые приёмы и абстракции функционального программирования: функции, поток управления и поток данных, сопоставление с образцом, рекурсия, свёртка, отображение, работа с функциями как с данными, списки.

## Условия задач

### Задача 1

Find the sum of all the multiples of 3 or 5 below 1000 


### Задача 30

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.


## Реализация

Посмотрим на решение представленных задач в императивном стиле на языке Golang

```golang
// golang/1.go
package main

import "fmt"

func main() {
	const N = 1000
	sum := sumMultiples3or5(N)
	fmt.Println(sum) // 233168
}

func sumMultiples3or5(n int) int {
	sum := 0
	for i := 0; i < n; i++ {
		if i%3 == 0 || i%5 == 0 {
			sum += i
		}
	}
	return sum
}
```

```golang
// golang/30.go
package main

import "fmt"

func main() {
	// since 6*9^5 = 354929 < 999999 - maximum 6-digit number, there is no point in searching above this limit
	const MAX = 1_000_000
	sum := 0
	// start with first 2-digit num
	for i := 10; i < MAX; i++ {
		if i == sumDigitsPower5(i) {
			sum += i
		}
	}
	fmt.Println(sum) // 443839
}

func sumDigitsPower5(n int) int {
	sum := 0
	for n > 0 {
		sum += power5(n % 10)
		n /= 10
	}
	return sum
}

func power5(n int) int {
	return n * n * n * n * n
}
```

### Haskell: задача 1

- Рекурсия:
```haskell
findSumMultiplies3or5below_rec n = findSumMultiplies3or5 (n - 1)
    where 
        findSumMultiplies3or5 0 = 0
        findSumMultiplies3or5 n = findSumMultiplies3or5 (n - 1) + if mod n 3 == 0 || mod n 5 == 0 then n else 0
```

- Хвостовая рекурсия:
```haskell
findSumMultiplies3or5below_tail n 
        | n < 3 = undefined
        | otherwise = helper n 0 3
    where 
        helper n s k
                | k == n = s
                | otherwise = helper n (s + if mod k 3 == 0 || mod k 5 == 0 then k else 0) (k+1)
```

- С использованием map:
```haskell
findSumMultiplies3or5below_map n = sum $ map (\x -> if mod x 5 == 0 || mod x 3 == 0 then x else 0) [1..n-1]   
```

- Генерация списков:
```haskell
findSumMultiplies3or5below_listgen n = sum [x | x <- [1..n-1], mod x 3 == 0 || mod x 5 == 0]
```

- Бесконечные списки:
```haskell
findSumMultiplies3or5below_inflist n = sum $ take (n-1) $ map (\x -> if mod x 5 == 0 || mod x 3 == 0 then x else 0) [1..]
```


### Haskell: задача 30

- Рекурсия:
```haskell
solveRec p n
        | n == 10 = 0
        | otherwise = solveRec p (n - 1) + if sumPower p (toDigits n) == n then n else 0
```
- Хвостовая рекурсия:
```haskell
solveRecTail p n = helper p n 0
    where
        helper _ 10 s = s
        helper p n s = helper p (n - 1) (s + if n == sumPower p (toDigits n) then n else 0)
```

- С использованием map:
```haskell
solveMap p n = sum $ map snd (filter (uncurry (==)) (map (\x -> (x, sumPower p (toDigits x))) [10..n]))
```

- Генерация списков:
```haskell
solveListGen p n = sum [x | x <- [10..n-1], sumPower p (toDigits x) == x]
```

- Бесконечные списки:
```haskell
solveInfList p n = sum $ map snd $ filter (uncurry (==)) $ take n $ map (\x -> (x, sumPower p (toDigits x))) [10..]
```

Полный код реализаций в папке ```src/```

## Вывод
Haskell - удивительный язык. Сначала моя программа не компилировалась, потому что я неправильно расставил скобки.
Затем моя программа не компилировалась, потому что я сделал недостаточно отступов. Наконец, моя программа скомпилировалась и даже работает - стало приятно. Смотрю на однострочник, решающий задачу - стало приятно. В общем, мне как человеку, ни разу не занимавшемуся кодингом в чистых функциональных ЯП все еще кажется это извращением, но начинает нравиться. Порой тяжело писать код, который непонятно как работает под капотом. Какая у него асимптотическая сложность? Как используется стек? В императивных языках смотришь на код - и сразу все ясно, здесь - пока нет. Но я обязательно научусь...