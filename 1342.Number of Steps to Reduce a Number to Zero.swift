class Solution {
    func numberOfSteps(_ num: Int) -> Int {
        var steps = 0
        var result = num
        while result != 0 {
            if result & 1 == 1 {
                result -= 1
            } else {
                result = result >> 1
            }
            
            steps += 1
        }
        return steps
    }
}
