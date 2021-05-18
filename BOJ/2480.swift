// BOJ 2480
let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }

if inputs[0] == inputs[1] && inputs[1] == inputs[2] {
    print(10000 + inputs[0] * 1000)
} else if inputs[0] == inputs[1] || inputs[1] == inputs[2] {
    print(1000 + inputs[1] * 100)
} else if inputs[0] == inputs[2] {
    print(1000 + inputs[0] * 100)
} else {
    print(inputs.max()! * 100)
}