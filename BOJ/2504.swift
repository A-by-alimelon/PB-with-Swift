// BOJ 2504
var input = Array(readLine()!)
var stack = [Character]()
var answer = 0
var temp = 1
var check = true

for i in 0..<input.count {
    let target = input[i]
    
    if target == "(" {
        stack.append(target)
        temp *= 2
    } else if target == "[" {
        stack.append(target)
        temp *= 3
    } else if target == ")" {
        if stack.isEmpty || stack.last != "(" {
            check = false
            break
        } else {
            if input[i-1] == "(" {
                answer += temp
            }
            stack.removeLast()
            temp /= 2
        }
    } else if target == "]" {
        if stack.isEmpty || stack.last != "[" {
            check = false
            break
        } else {
            if input[i-1] == "[" {
                answer += temp
            }
            stack.removeLast()
            temp /= 3
        }
    }
}

if !stack.isEmpty {
    check = false
}

print(check ? answer : 0)