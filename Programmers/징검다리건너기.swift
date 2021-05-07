// 징검다리 건너기
protocol Heap {
    associatedtype E
    var heap: [E] {get set}
    
    init()
    mutating func insert(_ data: E)
    mutating func pop() -> E?
    
}

extension Heap {
    init(_ data: E) {
        self.init()
        heap.append(data) // 0번은 임의의 값으로 채움
        heap.append(data) // 루트 노드

    }
    
    func printHeap() {
        print(heap)
    }
    
    func isEmpty() -> Bool {
        return heap.isEmpty
    }
    
}


/// Max Heap 구현
struct MaxHeap<T: Comparable>: Heap{
    var heap = [T]()
    
    init() {}
    
    mutating func insert(_ data: T) {
        // 힙에 데이터가 없을 때
        if heap.count < 1 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        // 1. 우선 삽입
        heap.append(data)
        
        // 부모 노드보다 큰 지 비교하는 함수
        func isBig(_ index: Int) -> Bool {
            
            if index == 1 {
                return false
            }
            
            let parentIndex = index / 2
            return heap[index] > heap[parentIndex] ? true: false
        }
        
        // 2. 부모 노드보다 작을 때까지 swap
        var index = heap.count - 1 // 삽입한 데이터의 인덱스 (마지막)
        while isBig(index) {
            let parentIndex = index / 2
            heap.swapAt(index, parentIndex)
            index = parentIndex
        }
    }
    
    mutating func pop() -> T? {
        // 없으면 nil
        if heap.count <= 1 {
            return nil
        }
        
        // 1. 루트 노드와 마지막 노드 swap
        let returnData = heap[1]
        heap.swapAt(1, heap.count - 1)
        heap.removeLast()
        
        // 자식 노드와 비교하여 swap 해야하는 인덱스 반환
        func findIndex(_ index: Int) -> Int? {
            let leftIndex = index * 2
            let rightIndex = index * 2 + 1
            
            // 자식 노드가 없는 경우
            if leftIndex >= heap.count {
                return nil
            }
            
            // 하나의 자식 노드(왼쪽)만 있는 경우
            if rightIndex >= heap.count {
                return heap[leftIndex] > heap[index] ? leftIndex : nil
            }
            
            // 자식 노드가 모두 있을 때
            if heap[index] > heap[leftIndex] && heap[index] > heap[rightIndex] {
                return nil
            } else {
                return heap[leftIndex] < heap[rightIndex] ? rightIndex : leftIndex
            }
        }
        
        var index = 1
        
        // swap할 노드가 없을 때까지 반복
        while findIndex(index) != nil {
            guard let swappedIndex = findIndex(index) else { return nil }
            heap.swapAt(index, swappedIndex)
            index = swappedIndex
        }
        
        return returnData
    }
    
}

func solution(_ stones:[Int], _ k:Int) -> Int {
    var start = 0
    var end = k-1
    var min = 300000000
    var heap = MaxHeap<Stone>()
    
    for i in 0...end {
        heap.insert(Stone(key: stones[i], index: i))
    }
    
    while true {
        let max = heap.heap[1].key
        
        if min > max {
            min = max
        }
        
        
        end += 1
        
        if end == stones.count {
            break
        }
        
        heap.remove(value: start)
        start += 1
        heap.insert(Stone(key: stones[end], index: end))
        
    }
    
    return min
}

struct Stone: Comparable {
    static func < (lhs: Stone, rhs: Stone) -> Bool {
        if lhs.key == rhs.key {
            return lhs.index > rhs.index
        }
        return lhs.key < rhs.key
    }
    
    var key: Int
    var index: Int
}

extension MaxHeap where T == Stone {
    mutating func remove(value: Int) {
        
        // 자식 노드와 비교하여 swap 해야하는 인덱스 반환
        func findIndex(_ index: Int) -> Int? {
            let leftIndex = index * 2
            let rightIndex = index * 2 + 1
            
            // 자식 노드가 없는 경우
            if leftIndex >= heap.count {
                return nil
            }
            
            // 하나의 자식 노드(왼쪽)만 있는 경우
            if rightIndex >= heap.count {
                return heap[leftIndex] > heap[index] ? leftIndex : nil
            }
            
            // 자식 노드가 모두 있을 때
            if heap[index] > heap[leftIndex] && heap[index] > heap[rightIndex] {
                return nil
            } else {
                return heap[leftIndex] < heap[rightIndex] ? rightIndex : leftIndex
            }
        }
        
        for i in 1..<heap.count {
            if heap[i].index == value {
                heap.swapAt(i, heap.count - 1)
                heap.removeLast()
                
                var index = i
                // swap할 노드가 없을 때까지 반복
                while findIndex(index) != nil {
                    if let swappedIndex = findIndex(index) {
                        heap.swapAt(index, swappedIndex)
                        index = swappedIndex
                    }
                }
                break
            }
        }
    }
}

print(solution([2, 4, 5, 3, 2, 1, 4, 2, 5, 1], 3))