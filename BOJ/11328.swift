// BOJ 11328
let N = Int(readLine()!)!
let a = UnicodeScalar("a").value

for _ in 0..<N {
    var isPossible = true
    var arr = Array(repeating: 0, count: 26)
    
    let inputs = readLine()!.split(separator: " ")
    for i in inputs[0] {
        let target = UnicodeScalar(String(i))!.value
        arr[Int(target%a)] += 1
    }
    
    for j in inputs[1] {
        let target = UnicodeScalar(String(j))!.value
        arr[Int(target%a)] -= 1
        if arr[Int(target%a)] < 0 {
            isPossible = false
            break
        }
    }
    
    for i in 0..<arr.count {
        if arr[i] > 0 {
            isPossible = false
        }
    }
    
    print(isPossible ? "Possible" : "Impossible")
}