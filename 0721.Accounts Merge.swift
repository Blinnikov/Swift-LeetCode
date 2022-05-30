class Solution {
    func accountsMerge(_ accounts: [[String]]) -> [[String]] {
        // groups[0] - ["johnsmith@mail.com","john_newyork@mail.com"]
        // groups[1] - nil <-- gets merged into 0
        // ...
        // Needs to be mapped into result
        var groups: [[String]?] = Array(repeating: [String](), count: accounts.count)
        for i in 0..<accounts.count {
            var group = accounts[i][1..<accounts[i].count]
            // print(group)
            groups[i] = Array(group)
        }
        
        // map email -> id in `groups` array
        // ["johnsmith@mail.com" : 0]
        var parents = [String:Int]()
        
        for i in 0..<groups.count {
            var newEmails = [String]()
            var groupsToRemove = [Int]()
            for j in 1...groups[i]!.count {
                // print("\(i):Checking: \(accounts[i][j])")
                if let existingParent = parents[accounts[i][j]], existingParent != i {
                    // print("\(i) - There's already group '\(existingParent)' for email '\(accounts[i][j])'")
                    update(parents: &parents, for: groups[existingParent]!, to: i)
                    newEmails += groups[existingParent]!
                    groupsToRemove.append(existingParent)
                        
                    // print("Updated groups: \(groups)")
                    
                } else {
                    parents[accounts[i][j]] = i
                }
            }
            
            groups[i] = groups[i]! + newEmails
            for g in groupsToRemove {
                groups[g] = nil
            }
        }
        
        var result = [[String]]()
        // print(groups)
        
        for i in 0..<groups.count {
            if let g = groups[i] {
                var sortedGroup = Array(Set(g)).sorted()
                result.append([accounts[i][0]] + sortedGroup)
            }
        }
        
        return result
    }
    
    private func update(parents: inout [String:Int], for emails: [String], to group: Int) {
        for email in emails {
            parents[email] = group
        }
    }
}
