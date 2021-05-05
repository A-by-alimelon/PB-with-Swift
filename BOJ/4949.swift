// BOJ 4949
while true {
    let inputs = readLine()!
    
    if inputs == "." {
        break
    }
    
    var isBalanced = true
    let bracket: [Character: Character] = ["[": "]", "(": ")"]
    var stack = [Character]()
    
    for i in inputs {
        if ["[", "("].contains(i) {
            stack.append(i)
        } else if ["]",")"].contains(i) {
            if stack.isEmpty {
                isBalanced = false
                break
            } else if bracket[stack.last!] != i {
                isBalanced = false
                break
            } else {
                stack.removeLast()
            }
        }
    }
    
    if !stack.isEmpty {
        isBalanced = false
    }
    
    print(isBalanced ? "yes" : "no")
}
