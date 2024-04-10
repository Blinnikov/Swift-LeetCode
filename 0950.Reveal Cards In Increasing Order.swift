class Solution {
    func deckRevealedIncreasing(_ deck: [Int]) -> [Int] {
        if deck.count == 1 {
            return deck
        }

        let deck = deck.sorted()

        var res = Array(repeating: 0, count: deck.count)

        var indexes = [Int]()
        indexes.reserveCapacity(res.count)
        
        for i in 0..<res.count {
            indexes.insert(i, at: 0)
        }

        for card in deck {
            let idx = indexes.removeLast()
            res[idx] = card

            if !indexes.isEmpty {
                indexes.insert(indexes.removeLast(), at: 0)
            }
        }

        return res
    }
}
