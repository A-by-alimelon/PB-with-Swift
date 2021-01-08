let input = readLine()!

var count = 0
let steps = [(2,-1), (2, 1), (1, 2), (-1, 2), (-2,-1), (-2, 1), (1, -2), (-1, -2)]

let column = UnicodeScalar(String(input[input.startIndex]))!.value - UnicodeScalar("a").value + 1
let row = input[input.index(after: input.startIndex)]

steps.forEach { step in
    let x = Int(column) + step.0
    let y = Int(String(row))! + step.1
    
    if x < 1 || y < 1 || x > 8 || y > 8 {
        return
    }
    
    count += 1
}

print(count)