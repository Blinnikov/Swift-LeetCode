class Solution {
    func sortArray(_ nums: [Int]) -> [Int] {
        // 1196 ms
        nums.sorted()
        
        // Runtime Error - how to deal with negative numbers?
        // radixSort(nums)
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
