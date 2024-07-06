class Solution {
    func passThePillow(_ n: Int, _ time: Int) -> Int {
       n - abs(n - 1 - time % (n * 2 - 2))
    }
}
