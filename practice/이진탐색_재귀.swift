// 재귀함수 이용 
func binarySearch(array: [Int], target: Int, start: Int, end: Int) -> Int? {
    if start > end {
        return nil
    }
    let mid = (start + end) / 2
    if array[mid] == target {
        return mid
    } else if array[mid] > target {
        return binarySearch(array: array, target: target, start: start, end: mid - 1)
    } else {
        return binarySearch(array: array, target: target, start: mid + 1, end: end)
    }
}

let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], target = inputs[1]
let array = readLine()!.split(separator: " ").map { return Int($0)! }

if let result = binarySearch(array: array, target: target, start: 0, end: n - 1) {
    print(result + 1)
} else {
    print("원소가 존재하지 않습니다")
}
