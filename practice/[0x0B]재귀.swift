// 재귀
// N부터 1까지 출력하는 함수
func printNum(_ num: Int) {
    if num == 1 {
        print(1)
    } else {
        print(num)
        printNum(num - 1)
    }
}

printNum(5)

// 1부터 N까지의 합을 구하는 함수
func calculateSum(_ num: Int) -> Int {
    if num == 1 {
        return 1
    }
    return num + calculateSum(num - 1)
}

print(calculateSum(10))