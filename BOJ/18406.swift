let input = readLine()!

var left: Int = 0
var right: Int = 0
var line = input.count / 2

for i in input {
    if line > 0 {
        left += Int(String(i))!
    } else {
        right += Int(String(i))!
    }
    line -= 1
}

if left == right {
    print("LUCKY")
} else {
    print("READY")
}