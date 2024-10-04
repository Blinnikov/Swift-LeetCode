class Solution {
    func dividePlayers(_ skill: [Int]) -> Int {
        var res = 0

        let skill = skill.sorted()
        var chem = skill.first! + skill.last!

        for i in 0..<skill.count / 2 {
            if skill[i] + skill[skill.count - i - 1] != chem {
                return -1
            }

            res += skill[i] * skill[skill.count - i - 1]
        }

        return res
    }
}
