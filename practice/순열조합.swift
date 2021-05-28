// 참고: https://woongsios.tistory.com/128?category=760578
var data = ["-", "+", "*"]

// 순열

func permutation(_ k: Int) {
    if k == data.count {
        print(data)
        return
    }
    
    for i in k..<data.count {
        data.swapAt(k, i)
        permutation(k + 1)
        data.swapAt(k, i)
    }
}

permutation(0)


// 조합

let total = [1, 2, 3, 4]
let count = 2

func select(_ cur: Int, _ selected: [Int]) { // 현재 합 sum, 선택된 원소 k개
    
    if cur == total.count {
        if selected.count == count {
            print(selected)
        }
        return
    }
    
    var temp = selected
    temp.append(total[cur])
    select(cur+1, temp) // 현재 인덱스의 숫자를 포함하는 경우
    select(cur+1, selected) // 현재 인덱스의 숫자를 포함하지 않는 경우
}

select(0, [])