class Solution {
    func smallestNumber(_ pattern: String) -> String {
        var chars = Array(pattern)
        
        var res = ""
        var st = [Int]()

        for i in 0...chars.count {
            st.append(i + 1)

            if i == pattern.count || chars[i] == "I" {
                while !st.isEmpty {
                    res += "\(st.removeLast())"
                }
            }
        }

        return res
    }
}
