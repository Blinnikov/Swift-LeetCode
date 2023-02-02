class Solution {
    private var map = Array(repeating: 0, count: 26)

    func isAlienSorted(_ words: [String], _ order: String) -> Bool {
        print(charToOrder(Character("a")))

        var order = Array(order)
        for i in 0..<order.count {
            let ch = order[i]
            map[charToOrder(ch)] = i
        }

        print(map)

        for i in 0..<words.count - 1 {
            let w1 = Array(words[i])
            let w2 = Array(words[i + 1])

            if !areWordsSorted(w1, w2) {
                return false
            }
        }

        return true
    }

    private func areWordsSorted(_ w1: [Character], _ w2: [Character]) -> Bool {
        for i in 0..<w1.count {
            if i >= w2.count {
                print("Length of first word \(i) is greater than the lenght of second one \(w2.count)")
                return false
            }

            if w1[i] != w2[i] {
                let o1 = map[charToOrder(w1[i])]
                let o2 = map[charToOrder(w2[i])]
                if o1 > o2 {
                    print("Comparing \(w1[i]) and \(w2[i])")
                    return false
                } else {
                    break
                }
            }
        }

        return true
    }

    private func charToInt(_ ch: Character) -> Int {
        Int(ch.asciiValue!)
    }

    private func charToOrder(_ ch: Character) -> Int {
        charToInt(ch) - charToInt(Character("a"))
    }
}
