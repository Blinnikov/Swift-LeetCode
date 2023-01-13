class Solution {
    private var result = 1

    func longestPath(_ parent: [Int], _ s: String) -> Int {
        var children = [Int:[Int]]()

        for i in 1..<parent.count {
            children[parent[i], default: [Int]()].append(i)
        }

        traverse(0, children, Array(s))

        return result
    }

    private func traverse(_ node: Int, _ children: [Int:[Int]], _ chars: [Character]) -> Int {
        guard let childrenForNode = children[node] else {
            return 1
        }

        var longestChain = 0
        var secondLongestChain = 0

        for child in childrenForNode {
            let longestChainStartingFromChild = traverse(child, children, chars)
            if chars[node] == chars[child] {
                continue
            }

            if longestChainStartingFromChild > longestChain {
                secondLongestChain = longestChain
                longestChain = longestChainStartingFromChild
            } else if longestChainStartingFromChild > secondLongestChain {
                secondLongestChain = longestChainStartingFromChild
            }
        }

        result = max(result, longestChain + secondLongestChain + 1)
        return longestChain + 1
    }
}
