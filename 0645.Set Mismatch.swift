class Solution {
    func findErrorNums(_ nums: [Int]) -> [Int] {
        var map = [Int:Int]()
        
        for num in nums {
            map[num, default: 0] += 1
        }
        
        var twice = -1
        var missed = -1
        
        for i in 1...nums.count {
            if let exist = map[i] {
                if exist == 2 {
                    twice = i
                }
            } else {
                missed = i
            }
        }
        
        return [twice, missed]
    }
}
