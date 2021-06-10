// BST(Binary Search Tree) 구현하기
class Node {
    var value: Int
    var left: Node?
    var right: Node?
    
    init(_ value: Int) {
        self.value = value
        self.left = nil
        self.right = nil
    }
}

class BinarySearchTree {
    var root: Node?
    
    init(value: Int) {
        self.root = Node(value)
    }
    
    // 탐색 연산
    func find(_ value: Int) -> Node? {
        guard let node = findNode(root, value) else {
            print("해당하는 노드가 존재하지 않습니다.")
            return nil
        }
        print(node.value)
        return node
    }
    
    func findNode(_ current: Node?, _ value: Int ) -> Node? {
        var current = current
        
        while current != nil {
            if value == current!.value {
                return current
            } else if value > current!.value {
                current = current!.right
            } else {
                current = current!.left
            }
        }
        
        return nil
    }
    
    // 삽입 연산
    func insert(_ value: Int) {
        if root == nil {
            root = Node(value)
            return
        }
        
        var current = root
        while current != nil {
            if value < current!.value {
                if current!.left == nil {
                    current!.left = Node(value)
                    return
                } else {
                    current = current?.left
                }
            } else if value > current!.value {
                if current?.right == nil {
                    current!.right = Node(value)
                    return
                } else {
                    current = current?.right
                }
            } else {
                // 이미 해당 숫자가 트리에 있는 경우
                print("해당 노드를 삽입할 수 없습니다.")
                return
            }
        }

    }
    
    // 삭제 연산
    func delete(_ value: Int) {
        var deleteNode: Node? = root
        var parentNode: Node? = nil
        
        while deleteNode != nil {
            if deleteNode!.value == value {
                break
            } else {
                parentNode = deleteNode
                deleteNode = value < deleteNode!.value ? deleteNode!.left : deleteNode!.right
            }
        }
        
        guard let deleteNode = deleteNode else {
            print("삭제할 노드가 없습니다.")
            return
        }
        
        // 1: 자식노드가 없을 경우
        if deleteNode.left == nil && deleteNode.right == nil {
            if parentNode != nil {
                if parentNode!.left?.value == deleteNode.value {
                    parentNode!.left = nil
                } else {
                    parentNode!.right = nil
                }
            } else {
                root = nil
            }
        }
        // 2: 자식노드가 하나일 경우
        else if deleteNode.left == nil || deleteNode.right == nil {
            let childNode = deleteNode.left != nil ? deleteNode.left : deleteNode.right
            
            if parentNode!.left?.value == deleteNode.value {
                parentNode!.left = childNode
            } else {
                parentNode!.right = childNode
            }
        }
        
        // 3: 자식노드가 2개일 경우
        else {
            var minParentNode = deleteNode
            var minRightChildNode = deleteNode.right
            
            while minRightChildNode!.left != nil {
                minParentNode = minRightChildNode!
                minRightChildNode = minRightChildNode!.left
            }
            
            // 오른쪽 서브트리의 최소 노드에 오른쪽 자식이 있을 경우
            if minRightChildNode?.right != nil {
                minParentNode.left = minRightChildNode?.right
                minRightChildNode?.right = nil
            } else {
                minParentNode.left = nil
            }
            
            deleteNode.value = minRightChildNode!.value
        }

    }
    
    // 중위 순회
    func traverse() -> [Int] {
        return traverseNode(root)
    }
    
    func traverseNode(_ current: Node?) -> [Int] {
        var result = [Int]()
        
        // left -> root -> right
        if current?.left != nil {
            result.append(contentsOf: traverseNode(current?.left))
        }
        if current != nil {
            result.append(current!.value)
        }
        if current?.right != nil {
            result.append(contentsOf: traverseNode(current?.right))
        }
        
        return result
    }
}


var BST = BinarySearchTree(value: 5)
BST.insert(3)
BST.insert(10)
BST.insert(8)
BST.insert(13)
BST.insert(7)
BST.insert(9)
BST.insert(11)
BST.insert(15)
BST.insert(12)
BST.delete(10)
print(BST.traverse())
