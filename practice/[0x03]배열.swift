func insert(_ idx: Int, _ num: Int, _ arr: inout [Int], _ len: inout Int) {
    if idx >= len {
        arr[idx] = num
        len += 1
    } else {
        for i in stride(from: len-1, through: idx, by: -1) {
            arr[i+1] = arr[i]
        }
        arr[idx] = num
        len += 1
    }
}

func erase(_ idx: Int, _ arr: inout [Int], _ len: inout Int) {
    for i in idx..<len {
        arr[i] = arr[i+1]
    }
    len -= 1
}

func insert_test() {
    print("=== insert test ===")
    var arr = [10, 20, 30, 0, 0, 0, 0, 0, 0, 0]
    var len = 3
    insert(3, 40, &arr, &len)
    print(arr)
    insert(1, 50, &arr, &len)
    print(arr)
    insert(0, 15, &arr, &len)
    print(arr)
}

func erase_test() {
    print("=== erase test ===")
    var arr = [10, 50, 40, 30, 70, 20, 0, 0, 0, 0]
    var len = 6
    erase(4, &arr, &len)
    print(arr)
    erase(1, &arr, &len)
    print(arr)
    erase(3, &arr, &len)
    print(arr)
}

insert_test()
erase_test()

var arr = [10, 50, 40, 30, 70, 20, 0, 0, 0, 0]
var len = 6
print("=================")
insert(3, 60, &arr, &len)
print(arr)
erase(4, &arr, &len)
print(arr)