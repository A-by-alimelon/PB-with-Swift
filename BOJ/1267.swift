// BOJ 1267
let n = Int(readLine()!)!
let inputs = readLine()!.split(separator: " ").map { return Int(String($0))! }

var m = 0
var y = 0

inputs.forEach {
    y += (($0 / 30) + 1) * 10
    m += (($0 / 60) + 1) * 15
}

if m == y {
    print("Y M \(m)")
} else if m < y {
  print("M \(m)" )
} else {
    print("Y \(y)")
}