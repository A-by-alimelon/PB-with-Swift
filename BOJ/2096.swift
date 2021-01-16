let n = Int(readLine()!)!
var colMax = [0, 0, 0], colMin = [0, 0, 0]
var tempMax = [0, 0, 0], tempMin = [0, 0, 0]


for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { return Int($0)! }
    if i == 0 {
        colMax = input
        colMin = input
    } else {
        tempMax = colMax
        tempMin = colMin
        
        colMax[0] = max(tempMax[0] + input[0], tempMax[1] + input[0])
        colMax[1] = max(tempMax[0] + input[1], tempMax[1] + input[1], tempMax[2] + input[1])
        colMax[2] = max(tempMax[1] + input[2], tempMax[2] + input[2])
        
        colMin[0] = min(tempMin[0] + input[0], tempMin[1] + input[0])
        colMin[1] = min(tempMin[0] + input[1], tempMin[1] + input[1], tempMin[2] + input[1])
        colMin[2] = min(tempMin[1] + input[2], tempMin[2] + input[2])
    }
}

print(colMax.max()!, colMin.min()!)