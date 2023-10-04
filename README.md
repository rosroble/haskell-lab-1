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