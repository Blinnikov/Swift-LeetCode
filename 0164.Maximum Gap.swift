class Solution {
    func maximumGap(_ nums: [Int]) -> Int {
        if nums.count < 2 {
            return 0
        }
        
        let nums = radixSort(nums)
        var res = 0
        
        for i in 1..<nums.count {
            res = max(res, nums[i]-nums[i-1])
        }
        
        return res
    }
    
    private func radixSort(_ arr: [Int]) -> [Int] {
        let base = 10
        var done = false
        var digits = 1
        
        var result = arr
        
        while !done {
            done = true
            var buckets: [[Int]] = .init(repeating: [], count: base)
            result.forEach { number in
                let remaining = number / digits
                let digit = remaining % base
                buckets[digit].append(number)
                     
                if remaining > 0 {
                    done = false
                }
            }
            
            digits *= base
            result = buckets.flatMap { $0 }
        }
        
        return result
    }
}
