// 사용자 정의 구현체 COW 구현하기
struct MyStruct {
    var name: String
    var age: Int
}

// 구조체를 감싸줄 Wrapper 클래스
class DataWrapper<T> {
    var data: T
    
    init(data: T) {
        self.data = data
    }
}

struct COWMyStruct<T> {
    private var dataWrapper: DataWrapper<T>
    
    init(data: T) {
        self.dataWrapper = DataWrapper(data: data)
    }
    
    var data: T {
        get {
            return self.dataWrapper.data
        }
        set {
            guard isKnownUniquelyReferenced(&dataWrapper) else {
                dataWrapper = DataWrapper(data: newValue)
                return
            }
            dataWrapper.data = newValue
        }
    }
}

let myStruct = MyStruct(name: "홍길동", age: 25)
var cowStruct1 = COWMyStruct(data: myStruct)
var cowStruct2 = cowStruct1
cowStruct1.data.age = 22 