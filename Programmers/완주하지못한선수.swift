/// 완주하지 못한 선수
func solution(_ participant: [String], _ completion: [String]) {
    var completion = completion.sorted()
    for p in participant {
        if binarySearch(array: &completion, target: p, start: 0, end: completion.count - 1) == nil {
            print(p)
            return
        }
    }
}

// 재귀 함수를 이용한 이진 탐색
func binarySearch(array: inout [String], target: String, start: Int, end: Int) -> Int? {
    if start > end {
        return nil
    }
    let mid = (start + end) / 2
    if array[mid] == target {
        array.remove(at: mid)
        return mid
    } else if array[mid] > target {
        return binarySearch(array: &array, target: target, start: start, end: mid - 1)
    } else {
        return binarySearch(array: &array, target: target, start: mid + 1, end: end)
    }
}

solution(["leo", "kiki", "eden"],["eden", "kiki"])
solution(["marina", "josipa", "nikola", "vinko", "filipa"], ["josipa", "filipa", "marina", "nikola"])
solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"])
