
func solution(_ s: String) -> Int {
    var str = s[s.startIndex..<s.endIndex]
    var answer = str.count
    for step in 1..<(str.count/2 + 1) {
        var compressed = ""
        var prev = str.prefix(step)
        var count = 1
        for _ in stride(from: step, to: str.count, by: step) {
            str = str.dropFirst(step)
            if prev == str.prefix(step) {
                count += 1
            } else {
                compressed += (count > 1) ? String(count) + prev : prev
                prev = str.prefix(step)
                count = 1
            }
        }
        
        if count > 1 {
            compressed += String(count) + prev
        } else { compressed += prev }

        answer = min(answer, compressed.count)
        str = s[s.startIndex..<s.endIndex]
    }
    
    return answer
}