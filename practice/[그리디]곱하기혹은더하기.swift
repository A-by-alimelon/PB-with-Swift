var input = readLine()!
var result = 0
input.forEach {
    if $0 == "0" || result == 0 {
        result += Int(String($0))!
    } else {
        result *= Int(String($0))!
    }
}

print(result)
