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
