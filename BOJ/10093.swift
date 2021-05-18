// BOJ 10093
var inputs = readLine()!.split(separator: " ").map { return Int64(String($0))! }
inputs.sort()

print(max(inputs[1] - inputs[0] - 1, 0))

if inputs[0] != inputs[1] {
    for i in (inputs[0] + 1)..<inputs[1] {
        print(i, terminator: " ")
    }
}