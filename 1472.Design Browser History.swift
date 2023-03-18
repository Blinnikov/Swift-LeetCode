class BrowserHistory {
    private var backHistory: [String]
    private var forwardHistory: [String]
    private var currentUrl: String

    init(_ homepage: String) {
        backHistory = []
        forwardHistory = []

        currentUrl = homepage
    }
    
    func visit(_ url: String) {
        forwardHistory = []

        backHistory.append(currentUrl)
        currentUrl = url

        // printDebugInfo("Visit")
    }
    
    func back(_ steps: Int) -> String {
        let count = min(steps, backHistory.count)

        for i in 0..<count {
            forwardHistory.insert(currentUrl, at: 0)
            currentUrl = backHistory.removeLast()
        }

        // printDebugInfo("Back")

        return currentUrl
    }
    
    func forward(_ steps: Int) -> String {
        let count = min(steps, forwardHistory.count)

        for i in 0..<count {
            backHistory.append(currentUrl)
            currentUrl = forwardHistory.removeFirst()
        }

        // printDebugInfo("Forward")

        return currentUrl
    }

    private func printDebugInfo(_ stepName: String) {
        print("\(stepName): \(backHistory) <- \(currentUrl) -> \(forwardHistory)")
    }
}

/**
 * Your BrowserHistory object will be instantiated and called as such:
 * let obj = BrowserHistory(homepage)
 * obj.visit(url)
 * let ret_2: String = obj.back(steps)
 * let ret_3: String = obj.forward(steps)
 */
