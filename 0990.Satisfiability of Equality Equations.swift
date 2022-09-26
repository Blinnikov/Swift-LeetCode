class Solution {
    
    private var storage = Array(repeating: -1, count: 26)
    private let a = 97
    
    func equationsPossible(_ equations: [String]) -> Bool {
        for i in 0..<26 {
            storage[i] = i
        }
        
        for e in equations {
            let chars = Array(e)
            if chars[1] == "=" {
                let left = find(Int(chars[0].asciiValue!) - a)
                let right = find(Int(chars[3].asciiValue!) - a)
                storage[left] = right
            }
        }

        for e in equations {
            let chars = Array(e)
            let left = find(Int(chars[0].asciiValue!) - a)
            let right = find(Int(chars[3].asciiValue!) - a)
            
            if chars[1] == "!" && left == right {
                return false
            }
        }
        
        return true
    }
    
    private func find(_ val: Int) -> Int {
        if storage[val] != val {
            storage[val] = find(storage[val])
        }
        
        return storage[val]
    }
}
