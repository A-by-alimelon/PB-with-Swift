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
    
    func insert(at index: Int, _ value: T) {
        let newNode = Node(value)
        var current = head
        
        if isEmpty { // 링크드 리스트가 비어있으면
            appendData(value)
        } else { // 링크드 리스트가 비어있지 않으면
            if index == 0 { // head에 삽입할 경우
                current?.next = head
                head?.prev = newNode
                head = newNode
            } else { // k번째에 삽입
                for _ in 0..<index - 1 { // 삽입하고자 하는 위치의 바로 직전 노드를 찾는다.
                    current = current?.next
                    
                    guard current != nil else { // k번째가 현재 노드의 개수보다 뒤일 경우
                        appendData(value) // 맨 뒤에 삽입
                        return
                    }
                }
                
                current?.next?.prev = newNode
                newNode.next = current?.next
                newNode.prev = current
                current?.next = newNode
            }
        }
    }
}