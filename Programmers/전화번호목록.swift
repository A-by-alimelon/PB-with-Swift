/// 전화번호 목록
func solution(_ phoneBook: [String]) -> Bool {
    let phoneBook = phoneBook.sorted()
    for i in 0..<phoneBook.count-1 {
        if phoneBook[i+1].hasPrefix(phoneBook[i]) {
            return false
        }
    }
    return true
}


print(solution(["119", "97674223", "1195524421"]))
print(solution(["123","456","789"]))
print(solution(["12","123","1235","567","88"]))
print(solution(["123","456","789", "7890"]))
