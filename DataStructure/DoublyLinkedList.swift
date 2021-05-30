class Node<T> {
    let value: T
    var prev: Node?
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

class LinkedList<T> {
    var head: Node<T>?
    var tail: Node<T>?
    
    var isEmpty: Bool {
        return head == nil
    }
    
    func appendData(_ value: T) {
        let newNode = Node<T>(value)
        
        if !isEmpty {
            tail?.next = newNode
            newNode.prev = tail
            tail = newNode
        } else {
            head = newNode
            tail = newNode
        }
    }

    
}