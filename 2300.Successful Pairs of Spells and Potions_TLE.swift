// TLE 52/56
class Solution {
    func successfulPairs(_ spells: [Int], _ potions: [Int], _ success: Int) -> [Int] {
        var result = Array(repeating: 0, count: spells.count)
        var potions = potions.sorted()

        for i in 0..<spells.count {
            let minPotionStrengthNeeded = (success + spells[i] - 1) / spells[i]

            // print("minPotionStrengthNeeded: \(minPotionStrengthNeeded)")
            // print("idx: \(idx)")
            if let idx = potions.firstIndex { $0 >= minPotionStrengthNeeded } {
                result[i] = potions.count - idx
            }
        }

        return result
    }
}
