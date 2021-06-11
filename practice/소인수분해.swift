// 소인수분해
func solution(_ num: Int) {
    var num = num
    var answer = ""
    for i in 2...num {
        while num % i == 0 {
            num /= i
            answer += "\(i) * "
        }
    }
    answer.removeLast(2)
    print(answer)
}

solution(20)