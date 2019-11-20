
extension Int {
    
    func expmod(_ base: Int, _ exp: Int, _ modulo: Int) -> Int {
        
        func isEven(_ number: Int) -> Bool {
            return number & 1 == 0
        }
        
        func modularSquare(_ number: Int, _ modulo: Int) -> Int {
            func modularSquare() -> Double {
                return pow(Double(number), 2).remainder(dividingBy: Double(modulo))
            }
            return Int(modularSquare())
        }
        
        if exp == 0 {
            return 1
        }else if isEven(exp) {
            return modularSquare(expmod(base, exp/2, modulo), modulo)
        }else {
            return (base * (expmod(base, (exp - 1), modulo))) % modulo
            
        }
    }
    
    
    var fermatTest:Bool {
        func pick(_ d: Int,_ n: Int) ->Bool {
            return d == expmod(d, n, n)
        }
        
        return pick(2, self)
    }
    
    
    func fermatIsPrime(nTimes count: Int) -> Bool {
        if count == 0 {
            return true
        }
        
        if self.fermatTest {
            return self.fermatIsPrime(nTimes: count-1)
        }else {
            return false
        }
    }
    
    
    var isPrime: Bool {
        if self <= 1 {
            return false
        }
        if self <= 3 {
            return true
        }
        if self % 2 == 0 || self % 3 == 0 {
            return false
        }
        
        var iNumber = 5
        while iNumber <= Int(pow(Double(self),0.5) + 1) {
            if self % iNumber == 0 || self % (iNumber + 2) == 0 {
                return false
            }
            iNumber += 6
        }
        
        return true
    }
    
    
    
}
