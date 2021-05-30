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
    
    var count = 0
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
        count += 1
    }
    
    func insert(at index: Int, _ value: T) {
        let newNode = Node(value)
        var current = head
        
        if isEmpty { // 링크드 리스트가 비어있으면
            appendData(value)
        } else { // 링크드 리스트가 비어있지 않으면
            if index == 0 { // head에 삽입할 경우
                newNode.next = head
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
                
                if index == count { // 삽입하고자 하는 인덱스가 링크드 리스트의 개수와 같으면 tail 업데이트
                    tail = newNode
                }
                current?.next?.prev = newNode
                newNode.next = current?.next
                newNode.prev = current
                current?.next = newNode
            }
            
            count += 1
            
        }
    }
    
    func printList() {
        guard !isEmpty else {
            print("리스트가 비었습니다. ")
            return
        }
        
        var current = head
        
        while current != nil {
            print(current!.value, terminator: " ")
            current = current?.next
        }
        print()
    }
    
    func removeData(_ value:T) {
        
    }
    
}

var linkedList = LinkedList<Int>()
linkedList.printList()
linkedList.appendData(1)
linkedList.printList()
linkedList.insert(at: 0, 2)
linkedList.printList()
linkedList.insert(at: 1, 3)
linkedList.printList()
linkedList.insert(at: 3, 4)
linkedList.printList()
linkedList.insert(at: 5, 5)
linkedList.printList()
linkedList.appendData(1)
linkedList.printList()
linkedList.insert(at: 5, 7)
linkedList.printList()
linkedList.insert(at: 0, 9)
linkedList.printList()