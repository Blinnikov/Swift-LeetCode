class Solution {
    func orderlyQueue(_ s: String, _ k: Int) -> String {
        let chars = Array(s)

        if k > 1 {
            return String(chars.sorted())
        }

        var result = s

        for i in 0..<chars.count {
            let temp = String(chars[i...] + chars[0..<i])
            if temp.compare(result) == .orderedAscending {
                result = temp
            }
        }

        return result
    }
}
