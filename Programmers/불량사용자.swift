// 불량 사용자
// 참고: https://velog.io/@teihong93/프로그래머스-불량-사용자-카카오-2019-인턴-3번

func solution(_ user_id:[String], _ banned_id:[String]) -> Int {
    var matching_ids = Array(repeating: [String](), count: banned_id.count)
    
    for i in 0..<banned_id.count {
        for u in user_id {
            if checkId(u, banned_id[i]) {
                matching_ids[i].append(u)
            }
        }
    }
    
    var resultSet = Set<String>()
    
    
    func dfs(_ matching_ids: [[String]], _ level: Int, idSet: Set<String>) -> Set<String> {
        if level == matching_ids.count {
            resultSet.insert(idSet.sorted().joined())
            return resultSet
        }
        
        for id in matching_ids[level] {
            var next = idSet
            next.insert(id)
            
            if next.count != idSet.count {
                dfs(matching_ids, level + 1, idSet: next)
            }
        }
        
        return Set<String>()
    }
    
    dfs(matching_ids, 0, idSet: Set<String>())
    
    return resultSet.count
}

func checkId(_ user_id: String, _ banned_id: String) -> Bool {
    let user_id = Array(user_id)
    let banned_id = Array(banned_id)
    
    if user_id.count != banned_id.count {
        return false
    }
    
    for i in 0..<user_id.count {
        if banned_id[i] != "*" && user_id[i] != banned_id[i] {
            return false
        }
    }
    
    return true
}

print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "abc1**"]))
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["*rodo", "*rodo", "******"]))
print(solution(["frodo", "fradi", "crodo", "abc123", "frodoc"], ["fr*d*", "*rodo", "******", "******"]))