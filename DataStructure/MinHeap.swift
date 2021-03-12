/// Min Heap 구현
struct MinHeap<T: Comparable> {
    private var heap = [T]()
    
    init() {}
    init(_ data: T) {
        heap.append(data) // 0번은 임의의 값으로 채움
        heap.append(data) // 루트 노드
    }
    
    mutating func insert(_ data: T) {
        // 힙에 데이터가 없을 때
        if heap.count < 1 {
            heap.append(data)
            heap.append(data)
            return
        }
        
        // 1. 우선 삽입
        heap.append(data)
        
        // 부모 노드보다 작은 지 비교하는 함수
        func isSmall(_ index: Int) -> Bool {
            
            if index == 1 {
                return false
            }
            
            let parentIndex = index / 2
            return heap[index] < heap[parentIndex] ? true: false
        }
        
        // 2. 부모 노드보다 작을 때까지 swap
        var index = heap.count - 1 // 삽입한 데이터의 인덱스 (마지막)
        while isSmall(index) {
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
                return heap[leftIndex] < heap[index] ? leftIndex : nil
            }
            
            // 자식 노드가 모두 있을 때
            if heap[index] < heap[leftIndex] && heap[index] < heap[rightIndex] {
                return nil
            } else {
                return heap[leftIndex] > heap[rightIndex] ? rightIndex : leftIndex
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
    
    func printHeap() {
        print(heap)
    }
}
