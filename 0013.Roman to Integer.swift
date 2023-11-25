class Solution {
    private let map: [Character: Int] = [
            "I": 1,
            "V": 5,
            "X": 10,
            "L": 50,
            "C": 100,
            "D": 500,
            "M": 1000
        ]
    
    func romanToInt(_ s: String) -> Int {
        var result = 0
        
        let arr = Array(s)
        var i = 0
        while i < arr.count {
            let nextCh: Character? = i+1 == arr.count ? nil : arr[i+1]
            let (inc, skipNext) = getValueForChar((arr[i], nextCh))
            result += inc
            if skipNext {
                i += 2
            } else {
                i += 1
            }
        }
        
        return result
    }
    
    private func getValueForChar(_ tuple: (Character, Character?)) -> (Int, Bool) {
        switch tuple {
            case ("I", "V"): return (4, true)
            case ("I", "X"): return (9, true)
            case ("X", "L"): return (40, true)
            case ("X", "C"): return (90, true)
            case ("C", "D"): return (400, true)
            case ("C", "M"): return (900, true)
            default: return (map[tuple.0] ?? 0, false)
        }
    }
}
