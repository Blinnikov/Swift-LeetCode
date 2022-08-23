
class RLEIterator {
    
    private var pointer = 0
    private var encoding = [Int]()

    init(_ encoding: [Int]) {
        self.encoding = encoding
    }
    
    func next(_ n: Int) -> Int {
        if pointer >= encoding.count {
            return -1
        }
        
        if pointer == encoding.count-2 && n > encoding[pointer] {
            encoding[pointer] = 0
            return -1
        }
        
        var n = n
        while n > encoding[pointer] {
            n -= encoding[pointer]
            encoding[pointer] = 0
            pointer += 2
        }
        
        var result = encoding[pointer+1]
        encoding[pointer] -= n
        if encoding[pointer] == 0 {
            pointer += 2
        }
        return result
    }
}

/**
 * Your RLEIterator object will be instantiated and called as such:
 * let obj = RLEIterator(encoding)
 * let ret_1: Int = obj.next(n)
 */
