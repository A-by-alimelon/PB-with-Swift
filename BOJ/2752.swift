// BOJ 2752
let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }

inputs.sorted().forEach {
    print($0, terminator: " ")
}