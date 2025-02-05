class Solution {
    func areAlmostEqual(_ s1: String, _ s2: String) -> Bool {
        let chars1 = Array(s1)
        let chars2 = Array(s2)

        var set1 = Set<Character>()
        var set2 = Set<Character>()
        
        var count = 0

        for i in 0..<s1.count {
            if chars1[i] != chars2[i] {
                set1.insert(chars1[i])
                set2.insert(chars2[i])

                count += 1
            }
        }

        return count == 0 || (count == 2 && set1 == set2) 
    }
}
