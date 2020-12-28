//링크드리스트로 구현
struct Queue<T> {
    
    private var linkedList = LinkedList<T>()
    
    var front: T? {
        return linkedList.head?.value
    }
    
    var rear: T? {
        return linkedList.tail?.value
    }
    
    mutating func enqueue(_ element: T) {
        linkedList.appendElement(element)
    }
    
    mutating func dequeue() -> T? {
        return linkedList.removeHead()
    }
    
}

struct LinkedList<T> {
    
    var head: Node<T>?
    var tail: Node<T>?
    var isEmpty: Bool {
        return head == nil
    }
    
    
    mutating func appendElement(_ element: T) {
        let newNode = Node(element)
        
        guard !isEmpty else {
            head = newNode
            tail = newNode
            return
        }
        
        tail?.next = newNode
        tail = newNode
    }
    
    mutating func removeHead() -> T? {
        guard !isEmpty else {
            print("isEmpty")
            return nil
        }
        
        defer {
            head = head?.next
        }
        
        return head?.value
    }
    

    
}

class Node<T> {
    
    let value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
    
}