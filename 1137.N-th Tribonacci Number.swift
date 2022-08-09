class Solution {
    private var map = [0:0, 1:1, 2:1]
    
    func tribonacci(_ n: Int) -> Int {
        if let exist = map[n] {
            return exist
        }
        
        let res = tribonacci(n-1) + tribonacci(n-2) + tribonacci(n-3)
        map[n] = res
        return res
    }
}
