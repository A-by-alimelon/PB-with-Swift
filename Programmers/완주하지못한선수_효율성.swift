/// 완주하지 못한 선수
func solution(_ participant: [String], _ completion: [String]) -> String {
    let participant = participant.sorted()
    let completion = completion.sorted()
    
    for i in 0..<completion.count {
        if participant[i] != completion[i] {
            return participant[i]
        }
    }
    return participant.last!
}

print(solution(["leo", "kiki", "eden"],["eden", "kiki"]))
print(solution(["marina", "josipa", "nikola", "vinko", "filipa"], ["josipa", "filipa", "marina", "nikola"]))
print(solution(["mislav", "stanko", "mislav", "ana"], ["stanko", "ana", "mislav"]))