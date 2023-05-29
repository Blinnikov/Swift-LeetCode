class ParkingSystem {
    private let bigTotalCount: Int
    private var bigActualCount: Int

    private let mediumTotalCount: Int
    private var mediumActualCount: Int

    private let smallTotalCount: Int
    private var smallActualCount: Int

    init(_ big: Int, _ medium: Int, _ small: Int) {
        self.bigTotalCount = big
        self.bigActualCount = 0

        self.mediumTotalCount = medium
        self.mediumActualCount = 0

        self.smallTotalCount = small
        self.smallActualCount = 0
    }
    
    func addCar(_ carType: Int) -> Bool {
        if carType == 1 {
            if bigActualCount < bigTotalCount {
                bigActualCount += 1
                return true
            }

            return false
        }

        if carType == 2 {
            if mediumActualCount < mediumTotalCount {
                mediumActualCount += 1
                return true
            }
            
            return false
        }

        if carType == 3 {
            if smallActualCount < smallTotalCount {
                smallActualCount += 1
                return true
            }
            
            return false
        }

        return false
    }
}

/**
 * Your ParkingSystem object will be instantiated and called as such:
 * let obj = ParkingSystem(big, medium, small)
 * let ret_1: Bool = obj.addCar(carType)
 */
