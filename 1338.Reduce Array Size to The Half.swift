class Solution {
    func minSetSize(_ arr: [Int]) -> Int {
        var arr = arr
        let neededCount = arr.count/2
        var map = [Int:Int]()
        for num in arr {
            map[num, default: 0] += 1
        }
        
        var pairs = map.count < arr.count ?  map.sorted { $0.1 > $1.1 } : Array(map)
        
        var size = 0        
        var countToRemove = 0
        for pair in pairs {
            countToRemove += pair.value
            size += 1
            if countToRemove >= neededCount {
                return size
            }
        }
        
        return size
    }
}
