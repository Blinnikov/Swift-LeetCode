class Solution {
    func reverse(_ x: Int) -> Int {
        if x < 10 && x > -10 {
            return x
        }
        
        var res = 0
        var left = x
        
        while left != 0 {
            let remainder = left % 10
            left /= 10
            
            res = res * 10 + remainder
        }
        
        return res > Int32.max || res < Int32.min ? 0 : res
    }
}
