class Solution {
    func reverseWords(_ s: String) -> String {
        s.components(separatedBy: " ")
            .filter { !$0.isEmpty }
            .reversed()
            .joined(separator: " ")
    }
}
