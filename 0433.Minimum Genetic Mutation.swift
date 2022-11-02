class Solution {
    
    private let elements: [Character] = ["A", "C", "G", "T"]
    
    func minMutation(_ start: String, _ end: String, _ bank: [String]) -> Int {
        var arrays = bank.map { Array($0) }
        let start = Array(start)
        let end = Array(end)
        
        // print(arrays)
        
        var queue = [[Character]]()
        var seen = Set<[Character]>()
        queue.append(start)
        seen.insert(start)
        
        var result = 0
        
        while !queue.isEmpty {
            var size = queue.count
            while size > 0 {
                let gene = queue.removeLast()
                if gene == end {
                    return result
                }
                
                for el in elements {
                    for i in 0..<gene.count {
                        var nextGene = gene
                        nextGene[i] = el
                        
                        if !seen.contains(nextGene) && arrays.contains(nextGene) {
                            queue.insert(nextGene, at: 0)
                            seen.insert(nextGene)
                        }
                    }
                }
                
                size -= 1
            }
            
            result += 1
        }
        
        return -1
    }
}
