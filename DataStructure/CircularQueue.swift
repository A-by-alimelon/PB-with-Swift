// 원형 큐(Circular Queue) 구현
class CircularQueue {
    var queue: [Int]
    var head = 0
    var tail = 0
    
    // queue에는 maxSize-1 개의 원소까지 담을 수 있다.
    var maxSize: Int
    
    init(maxSize: Int) {
        self.maxSize = maxSize
        self.queue = Array(repeating: 0, count: maxSize)
    }
    
    func enqueue(_ value: Int) {
        if size() == maxSize - 1 {
            print("Queue에 더 이상 데이터를 넣을 수 없습니다.")
            return
        }
        
        queue[tail] = value
        tail = (tail + 1) % maxSize
    }
    
    func dequeue() -> Int? {
        guard size() != 0 else {
            return nil
        }
        let data = queue[head]
        head = (head + 1) % maxSize
        return data
    }
    
    func size() -> Int {
        if tail >= head {
            return tail - head
        } else {
            return maxSize - (head - tail)
        }
    }
    
    func printQueue() {
        var index = head
        print("head: \(head)")
        print(size())
        for _ in 0..<size() {
            print(queue[index], terminator: " ")
            index = (index + 1) % maxSize
        }
        print()
    }
}

var CQ = CircularQueue(maxSize: 5)
CQ.enqueue(1)
CQ.enqueue(2)
CQ.enqueue(3)
CQ.enqueue(4)

CQ.printQueue()
print(CQ.dequeue()!)
CQ.printQueue()
CQ.enqueue(5)
CQ.printQueue()
CQ.enqueue(5)
print(CQ.dequeue()!)
CQ.printQueue()
CQ.enqueue(5)
CQ.printQueue()
print(CQ.dequeue()!)
CQ.enqueue(5)
CQ.printQueue()