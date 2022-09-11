class Solution {
    func topKFrequent(_ nums: [Int], _ k: Int) -> [Int] {
        var map = [Int:Int]()
        for n in nums {
            map[n, default: 0] += 1
        }
        
        let ordered = map.sorted { $0.1 > $1.1 }
        
        var result = [Int]()
        var cur = 0
        for (key,v) in ordered {
            if cur == k {
                break
            }
            result.append(key)
            cur += 1
        }
        
        return result
    }
}
