class Solution {
    func lengthOfLastWord(_ s: String) -> Int {
        s.split(separator: " ").last!.count
    }
}
