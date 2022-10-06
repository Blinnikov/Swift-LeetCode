
class TimeMap {
    
    private var map: [String:[(Int,String)]]

    init() {
        map = [String:[(Int,String)]]()
    }
    
    func set(_ key: String, _ value: String, _ timestamp: Int) {
        map[key, default: [(Int,String)]()].append((timestamp, value))
    }
    
    func get(_ key: String, _ timestamp: Int) -> String {
        if let timestamps = map[key] {
            if timestamp < timestamps[0].0 {
                return ""
            }
            
            var lo = 0, hi = timestamps.count
            while lo < hi {
                let mid = (lo + hi) / 2
                let t = timestamps[mid].0
                if t <= timestamp {
                    lo = mid + 1
                } else {
                    hi = mid
                }
            }
            
            if hi == 0 {
                return ""
            }
            
            return timestamps[hi - 1].1
            
        } else {
            return ""
        }
    }
}

/**
 * Your TimeMap object will be instantiated and called as such:
 * let obj = TimeMap()
 * obj.set(key, value, timestamp)
 * let ret_2: String = obj.get(key, timestamp)
 */
