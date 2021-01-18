// 정확도는 통과, 효율성은 통과하지 못하는 코드

func solution(_ food_times:[Int], _ k:Int64) -> Int {
    var k = Int(k)
    var total = food_times.reduce(0) { $0 + $1 }
    
    var foodTimes = food_times.enumerated().map { return ($1, $0) }.sorted(by: <)
    var answer = 0
    var cycle = foodTimes.first!.0 * foodTimes.count
    
    while true {
        
        if total <= k {
            return -1
        }
        
        if k < cycle {
            break
        }
        
        total -= cycle
        k -= cycle
        
        cycle = (foodTimes[1].0 - foodTimes[0].0) * (foodTimes.count - 1)
        foodTimes.removeFirst()
    }
    
    foodTimes.sort(by: sortFood(this:that:))
    answer = foodTimes[k % foodTimes.count].1 + 1
    
    return answer
}

func sortFood(this: (Int, Int), that: (Int, Int)) -> Bool {
    return this.1 < that.1
}

print(solution([4,2,3,6,7,1,5,8], 27))
