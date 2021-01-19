let inputs = readLine()!.split(separator: " ").map { return Int($0)! }
let n = inputs[0], m = inputs[1]

var map = [[Int]]()

for _ in 0..<n {
    map.append(readLine()!.split(separator: " ").map { return Int($0)! })
}

var chickens = [Point](), houses = [Point]()


for i in 0..<n {
    for j in 0..<n {
        if map[i][j] == 1 {
            houses.append(Point(x: i + 1, y: j + 1))
        } else if map[i][j] == 2 {
            chickens.append(Point(x: i + 1, y: j + 1))
        }
    }
}

var deletes = [[Point]]()
combination(total: chickens, shouldSelect: chickens.count - m, current: 0, selected: [])

var answer = 999999999

deletes.forEach { chicken in
    let temp = chickens.filter { !chicken.contains($0) }
    var chickenDistance = 0
    
    houses.forEach { house in
        var distances = [Int]()
        temp.forEach {
            distances.append(house.findDistance(with: $0))
        }
        chickenDistance += distances.min()!
    }
    
    if chickenDistance < answer {
        answer = chickenDistance
    }
}

print(answer)

struct Point: Equatable {
    var x: Int
    var y: Int
    
    func findDistance(with p: Point) -> Int {
        return abs(x - p.x) + abs(y - p.y)
    }
}

func combination(total: [Point], shouldSelect: Int, current index: Int, selected: [Point]) {
    if shouldSelect == 0 {
        deletes.append(selected)
    } else if index == total.count {
        return
    } else {
        var newSelected = selected
        newSelected.append(total[index])
        combination(total: total, shouldSelect: shouldSelect - 1, current: index + 1, selected: newSelected)
        combination(total: total, shouldSelect: shouldSelect, current: index + 1, selected: selected)
    }
}