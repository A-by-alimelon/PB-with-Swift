let input = readLine()!

var count0 = 0
var count1 = 0

if input[input.startIndex] == "1" {
    count0 += 1
} else {
    count1 += 1
}

for i in 0..<input.count - 1 {
    let index = input.index(input.startIndex, offsetBy: i)
    let nextIndex = input.index(input.startIndex, offsetBy: i + 1)
    if input[index] != input[nextIndex] {
        if input[nextIndex] == "1" {
            count0 += 1
        } else {
            count1 += 1
        }
    }
}

print(min(count0, count1))