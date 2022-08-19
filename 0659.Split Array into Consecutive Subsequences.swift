class Solution {
    func isPossible(_ nums: [Int]) -> Bool {
        var map = [Int:Int]()
        var end = [Int:Int]()
        
        for num in nums {
            map[num, default: 0] += 1
        }
        
        for num in nums {
            if let exist = map[num], exist > 0 {
                map[num] = exist - 1
                
                if let prevEnd = end[num-1], prevEnd > 0 {
                    end[num, default: 0] += 1
                    end[num-1] = prevEnd - 1
                } else if let mapNext = map[num+1], let mapAfterNext = map[num+2], mapNext > 0 && mapAfterNext > 0 {
                    map[num+1] = mapNext - 1
                    map[num+2] = mapAfterNext - 1
                    end[num+2, default: 0] += 1
                } else {
                    return false
                }
            }
        }
        
        return true
    }
}
