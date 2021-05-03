// BOJ 10808
var input = readLine()!
var alphabets = Array(repeating: 0, count: 26)

for c in input {
    let index = Int(UnicodeScalar(String(c))!.value - 97)
    alphabets[index] += 1
}

for a in alphabets {
    print(a, terminator: " ")
}