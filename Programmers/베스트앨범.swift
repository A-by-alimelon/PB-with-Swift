// 베스트앨범
func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    var countDict = [String: Int]()
    var songDict = [String: [(Int, Int)]]()
    var result = [Int]()
    
    for i in 0..<plays.count {
        if countDict[genres[i]] == nil {
            countDict[genres[i]] = plays[i]
        } else {
            countDict[genres[i]]! += plays[i]
        }
        
        if songDict[genres[i]] == nil {
            songDict[genres[i]] = [(plays[i], i)]
        } else {
            songDict[genres[i]]!.append((plays[i], i))
        }
    }

    var sorted = countDict.sorted { $0.value > $1.value }

    for _ in 0..<countDict.count {
        let target = sorted.removeFirst()
        var songs = songDict[target.key]!.sorted(by: sortSongs(this:that:))

        for _ in 0..<2 {
            result.append(songs.removeFirst().1)
            if songs.isEmpty {
                break
            }
        }
       
    }
    
    return result
}

func sortSongs(this: (Int, Int), that: (Int, Int)) -> Bool {
    if this.0 == that.0 {
        return this.1 < that.1
    } else {
        return this.0 > that.0
    }
}