class Solution {
    func letterCasePermutation(_ s: String) -> [String] {
        let n = s.count
        var result = [String]()
        cycle(0, n, Array(s), &result)
        return result
    }
    
    private func cycle(_ step: Int, _ n: Int, _ cur: [Character], _ result: inout[String]) {
        if step == n {
            result.append(String(cur))
            return
        }
        
        if cur[step].isLetter {
            var copy = cur
            if cur[step].isUppercase {
                copy[step] = Character(copy[step].lowercased())
                cycle(step+1, n, copy, &result)
            } else {
                copy[step] = Character(copy[step].uppercased())
                cycle(step+1, n, copy, &result)
            }
        }
        
        cycle(step+1, n, cur, &result)
    }
}
