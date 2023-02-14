class Solution {
    func addBinary(_ a: String, _ b: String) -> String {
        let a = Array(a)
        let b = Array(b); print("b - \(b.count)")
        let maxCount = max(a.count, b.count)
        let minCount = min(a.count, b.count)
        var result = ""
        
        var transfer = false
        for i in 0..<maxCount {
            let aItem = i < a.count ? a[a.count - i - 1] : "0"
            let bItem = i < b.count ? b[b.count - i - 1] : "0"
            
            var newItem = "0"
            if transfer {
                if aItem == "1" && bItem == "1" {
                    newItem = "1"
                    transfer = true
                } else if (aItem == "1" && bItem == "0") || (aItem == "0" && bItem == "1") {
                    newItem = "0"
                    transfer = true
                } else {
                    newItem = "1"
                    transfer = false
                }
            } else {
                if aItem == "1" && bItem == "1" {
                    newItem = "0"
                    transfer = true
                } else if (aItem == "1" && bItem == "0") || (aItem == "0" && bItem == "1") {
                    newItem = "1"
                    transfer = false
                } else {
                    newItem = "0"
                    transfer = false
                }
            }
            
            result = newItem + result
        }
        
        if transfer {
            result = "1" + result
        }
        
        return result
    }
}
