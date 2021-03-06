// 부품 찾기 - 이진 탐색 이용
let n = Int(readLine()!)!
var inputs = readLine()!.split(separator: " ").map { return Int($0)!}
print(n)
print(inputs)
let m = Int(readLine()!)!
let targets = readLine()!.split(separator: " ").map { return Int($0)! }

inputs.sort()
for t in targets {
    binarySearch(inputs, t)
}

func binarySearch(_ array: [Int], _ target: Int) {
    var start = 0, end = array.count - 1
    
    while start <= end {
        let mid = (start + end) / 2
        if array[mid] == target {
            print("yes", terminator: " ")
            return
        } else if array[mid] > target {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
    print("no", terminator: " ")
}