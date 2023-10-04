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

