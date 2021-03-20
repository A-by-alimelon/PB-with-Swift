// K번째 수

func solution(_ array:[Int], _ commands:[[Int]]) -> [Int] {
    var answer = [Int]()
    
    commands.forEach { command in
        var slice = Array(array[(command[0]-1)...(command[1]-1)])
        slice.sort()
        answer.append(slice[command[2]-1])
    }
    
    return answer
}

print(solution([1, 5, 2, 6, 3, 7, 4], [[2, 5, 3], [4, 4, 1], [1, 7, 3]]))
