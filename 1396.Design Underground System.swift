class UndergroundSystem {
    private var users = [Int:(String,Int)]()
    private var times = [String:[Int]]()

    init() {
        
    }
    
    func checkIn(_ id: Int, _ stationName: String, _ t: Int) {
        users[id] = (stationName, t)
    }
    
    func checkOut(_ id: Int, _ stationName: String, _ t: Int) {
        if let start = users[id] {
            let station = start.0
            let time = start.1

            times["\(station):\(stationName)", default: [Int]()].append(t - time)
        }
    }
    
    func getAverageTime(_ startStation: String, _ endStation: String) -> Double {
        if let timesForRoute = times["\(startStation):\(endStation)"] {
            let avg = Double(timesForRoute.reduce(0, +)) / Double(timesForRoute.count)

            return avg
        }

        return 0.0
    }
}

/**
 * Your UndergroundSystem object will be instantiated and called as such:
 * let obj = UndergroundSystem()
 * obj.checkIn(id, stationName, t)
 * obj.checkOut(id, stationName, t)
 * let ret_3: Double = obj.getAverageTime(startStation, endStation)
 */
