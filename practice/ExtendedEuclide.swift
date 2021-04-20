// 확장 유클리드 알고리즘 
func extendedEuclid(_ a: Int, _ b: Int) -> (Int, Int, Int){
    if a == b {
        return (1, 0, a)
    } else if b == 0 {
        return (1, 0, a)
    } else {
        var x1 = 1
        var y1 = 0
        var r1 = a
        
        var x2 = 0
        var y2 = 1
        var r2 = b
        
        while r2 != 0 {
            let q = r1 / r2
            
            let xt = x1 - q*x2
            let yt = y1 - q*y2
            let rt = r1 - q*r2
            
            x1 = x2
            y1 = y2
            r1 = r2
            
            x2 = xt
            y2 = yt
            r2 = rt
        }
        
        return (x1, y1, r1)
    }
}


print(extendedEuclid(550, 1759))
print(extendedEuclid(710, 310))
print(extendedEuclid(8, 0))
print(extendedEuclid(300, 10))
