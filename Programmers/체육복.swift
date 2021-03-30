func solution(_ n:Int, _ lost:[Int], _ reserve:[Int]) -> Int {
    let lost = Set(lost)
    let reserve = Set(reserve)
    
    var subtractedLost = lost.subtracting(reserve)
    let subtractedReserve = reserve.subtracting(lost)

    for r in subtractedReserve.sorted() {
        if subtractedLost.contains(r - 1) {
            if let index = subtractedLost.firstIndex(of: r - 1) {
                subtractedLost.remove(at: index)
            }
        } else if subtractedLost.contains(r + 1) {
            if let index = subtractedLost.firstIndex(of: r + 1) {
                subtractedLost.remove(at: index)
            }
        }
        
        if lost.isEmpty {
            break
        }
    }
    
    return n - subtractedLost.count
}