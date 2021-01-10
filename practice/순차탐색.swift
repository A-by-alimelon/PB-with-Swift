func sequentialSearch(n: Int, target: String, array: [String]) -> Int {
    for i in 0..<n {
        if array[i] == target {
            return i + 1
        }
    }
    return -1
}

print("생성할 원소 개수를 입력한 다음 한 칸 띄고 찾을 문자열을 입력하세요.")
let inputs = readLine()!.split(separator: " ")
let n = Int(inputs[0])!
let target = String(inputs[1])

print("앞 서 적은 원소 개수만큼 문자열을 입력하세요. 구분은 띄어쓰기 한 칸으로 합니다.")
let array = readLine()!.split(separator: " ").map { return String($0) }

print(sequentialSearch(n: n, target: target, array: array))