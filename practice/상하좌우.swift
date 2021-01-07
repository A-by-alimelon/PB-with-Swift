let n = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ")
var currentIndex = (1, 1)

let dx = [0, 0, -1, 1]
let dy = [-1, 1, 0, 0]
let moveTypes = ["L", "R", "U", "D"]
var x = 0, y = 0

inputs.forEach { input in
    for i in 0..<moveTypes.count {
        if input == moveTypes[i] {
            x = currentIndex.0 + dx[i]
            y = currentIndex.1 + dy[i]
        }
    }
    if x < 1 || x > n || y < 1 || y > n {
        return
    }
    
    currentIndex.0 = x
    currentIndex.1 = y
}

print("\(currentIndex.0) \(currentIndex.1)")