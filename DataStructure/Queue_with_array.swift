// 배열로 구현
struct Queue<T> {
    
    private var elements = [T]()
    
    var front: T? {
        return elements.first
    }
    
    var rear: T? {
        return elements.last
    }
    
    mutating func enqueue(_ element: T) {
        elements.append(element)
    }
    
    mutating func dequeue() -> T? {
        return elements.isEmpty ? nil : elements.removeFirst()
    }
    
}