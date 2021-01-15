func solution(_ numbers: [Int], _ hand: String) -> String {
    var result = ""
    var left = 10, right = 12
    
    numbers.forEach {
        if [1, 4, 7].contains($0) {
            result += "L"
            left = $0
        } else if [3, 6, 9].contains($0) {
            result += "R"
            right = $0
        } else {
            var number = $0
            if $0 == 0 {
                number = 11
            }
            let leftDistance = findDistance(left, number)
            let rightDistance = findDistance(right, number)
            if leftDistance == rightDistance {
                result += hand[hand.startIndex].uppercased()
                if hand == "right" {
                    right = number
                } else {
                    left = number
                }
            } else {
                if leftDistance > rightDistance {
                    result += "R"
                    right = number
                } else {
                    result += "L"
                    left = number
                }
            }
        }
    }
    return result
}

func findDistance(_ current: Int, _ target: Int) -> Int {
    var current = current
    
    let currentRow = current % 3 != 0 ? current / 3 : current / 3 - 1
    let targetRow = target % 3 != 0 ? target / 3 : target / 3 - 1
    var distance = abs(targetRow - currentRow)
    
    current += 3 * (targetRow - currentRow)
    distance += abs(target - current)
    
    return distance
}