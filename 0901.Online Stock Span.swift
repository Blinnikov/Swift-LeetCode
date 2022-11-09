class StockSpanner {

    private var stack: [(price: Int, days: Int)]

    init() {
        stack = [(Int, Int)]()
    }
    
    func next(_ price: Int) -> Int {
        var res = 1

        while !stack.isEmpty, stack.last!.price <= price {
            res += stack.removeLast().days
        }

        stack.append((price, res))

       return res
    }
}

/**
 * Your StockSpanner object will be instantiated and called as such:
 * let obj = StockSpanner()
 * let ret_1: Int = obj.next(price)
 */
