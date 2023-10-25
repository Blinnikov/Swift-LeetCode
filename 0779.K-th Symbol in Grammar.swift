class Solution {
    func kthGrammar(_ n: Int, _ k: Int) -> Int {
        var bitCount = 0
        var k = k - 1

        while k > 0 {
            k &= (k - 1)
            bitCount += 1
        }

        return bitCount & 1
    }
}
