class Solution {
    func smallestSufficientTeam(_ req_skills: [String], _ people: [[String]]) -> [Int] {
        var skillIdMap = [String:Int]()
        for i in 0..<req_skills.count {
            skillIdMap[req_skills[i]] = i
        }

        var dp: [[Int]?] = Array(repeating: nil, count: 1 << req_skills.count)
        dp[0] = [Int]()

        for i in 0..<people.count {
            var personSkillSet = 0

            for personSkill in people[i] {
                personSkillSet |= 1 << skillIdMap[personSkill]!
            }

            for skillSet in 0..<dp.count {
                if dp[skillSet] == nil {
                    continue
                }

                let nextSkillSet = skillSet | personSkillSet

                if dp[nextSkillSet] == nil || dp[skillSet]!.count + 1 < dp[nextSkillSet]!.count {
                    dp[nextSkillSet] = dp[skillSet]
                    dp[nextSkillSet]!.append(i)
                }
            }
        }

        return dp.last!!
    }
}
