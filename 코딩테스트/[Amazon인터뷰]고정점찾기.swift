let n = Int(readLine()!)!
var array = readLine()!.split(separator: " ").map { return Int($0)! }

print(binarySearch(array: array))

func binarySearch(array: [Int]) -> Int {
    var start = 0, end = n
    while start <= end {
        let mid = (start + end) / 2
        
        if array[mid] == mid {
            return mid
        } else if array[mid] < mid {
            start = mid + 1
        } else {
            end = mid - 1
        }
    }
    
    return -1
}
