class Solution {
    func removeSubfolders(_ folder: [String]) -> [String] {
        var folders = folder.map { $0.components(separatedBy: "/") }
        var set = Set(folders)
        var res = [String]()

        for (idx, f) in folders.enumerated() {
            var subFolder = false
            var parent = f

            while !parent.isEmpty {
                parent.removeLast()

                if set.contains(parent) {
                    subFolder = true
                    break
                }
            }

            if !subFolder {
                res.append(folder[idx])
            }
        }

        return res
    }
}
