class Solution {
    func simplifyPath(_ path: String) -> String {
        var stack = [String]()
        var skipParts = Set(["..", ".", ""])

        let dirs = path.components(separatedBy: "/")

        for dir in dirs {
            if dir == ".." && !stack.isEmpty {
                stack.removeLast()
            } else if !skipParts.contains(dir) {
                stack.append(dir)
            }
        }

        // print(stack)

        return "/" + stack.joined(separator: "/")
    }
}
