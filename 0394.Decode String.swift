class Solution {
    func decodeString(_ s: String) -> String {
        let s = Array(s)
        
        var result = "";
        var nums = [Int]();
        var strings = [String]();
        var idx = 0;
        
        while (idx < s.count) {
            if (s[idx].isNumber) {
                var count = "";
                while (s[idx].isNumber) {
                    count = count + String(s[idx])
                    idx += 1
                }
                nums.append(Int(count)!);
            }
            else if (s[idx] == "[") {
                strings.append(result);
                result = "";
                idx += 1
            }
            else if (s[idx] == "]") {
                var subRes = ""
                let prefix = strings.removeLast()
                subRes += prefix
                let num = nums.removeLast()
                
                for i in 0..<num {
                    subRes += result
                }
                
                result = subRes
                idx += 1
            }
            else {
                result += String(s[idx])
                idx += 1
            }
        }
        return result;
    }
}
