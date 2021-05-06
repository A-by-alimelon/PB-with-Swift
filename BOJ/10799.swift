// BOJ 10799
var input = readLine()!
var stack = [Character]()
var prev: Character = "-"
var result = 0

for i in input {
    if i == "(" {
        stack.append(i)
    } else if i == ")" {
        stack.removeLast()
        if prev == "(" {
            result += stack.count
        } else {
            result += 1
        }
    }
    prev = i
}

print(result)
