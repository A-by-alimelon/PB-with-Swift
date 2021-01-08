var n = 1260
var count = 0

let coinTypes = [500, 100, 50, 10]

for coin in coinTypes {
    count += n / coin
    n %= coin
}

print(count)