class Solution {
    func isPalindrome(_ x: Int) -> Bool {
        if x < 0 {
            return false 
        }
        var arr = [Int]()
        var remainder = x
        while remainder != 0 {
            arr.append(remainder % 10)
            remainder = remainder / 10
        }
        
        for i in 0..<arr.count {
            if arr[i] != arr[arr.count - 1 - i] {
                return false 
            }
        }
        
        return true 
    }
}
