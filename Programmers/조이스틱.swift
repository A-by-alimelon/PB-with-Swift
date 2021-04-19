// 조이스틱
func solution(_ name:String) -> Int {
    var answer = 0
    let a = UnicodeScalar("A").value
    let z = UnicodeScalar("Z").value
    let initialString = Array(repeating: String("A"), count: name.count)
    let name = name.map(String.init)
    var current = 0
    var target = 0
    
    while target != name.count {
        
        if initialString[target] != name[target] {
            
            let forward = target - current
            let backward = current + (name.count - 1) - target + 1
            
            answer += min(forward, backward)
            
            let value = UnicodeScalar(name[target])!.value
            let forAlpha = Int(value - a)
            let backAlpha = Int(z - value + 1)
            
            answer += min(forAlpha, backAlpha)
            
            current = target
        }
        
        target += 1
    }
    
    return answer
}