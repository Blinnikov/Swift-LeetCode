class Solution {
    func minPartitions(_ n: String) -> Int {
        Array(n).map { $0.wholeNumberValue! }.max()!
    }
}
