class Solution {
    private let factors = [2, 3, 5]

    func nthUglyNumber(_ n: Int) -> Int {
        var pq = PriorityQueue<Int>(sort: <)
        var set = Set<Int>()

        pq.enqueue(1)
        set.insert(1)

        var res = 1

        for i in 0..<n {
            res = pq.dequeue()!

            for f in factors {
                let next = res * f

                if !set.contains(next) {
                    set.insert(next)
                    pq.enqueue(next)
                }
            }
        }

        return res
    }
}

struct PriorityQueue<Element: Equatable> : Queue {
    private var heap: Heap<Element>

    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        heap = Heap(sort: sort, elements: elements)
    }

    var isEmpty: Bool {
        heap.isEmpty
    }

    var peek: Element? {
        heap.peek()
    }

    mutating func enqueue(_ element: Element) -> Bool {
        heap.insert(element)
        return true
    }

    mutating func dequeue() -> Element? {
        heap.remove()
    }
}

public protocol Queue {
    associatedtype Element
    mutating func enqueue(_ element: Element) -> Bool
    mutating func dequeue() -> Element?
    var isEmpty: Bool { get }
    var peek: Element? { get }
}

struct Heap<Element: Equatable> {
    var elements: [Element] = []
    let sort: (Element, Element) -> Bool

    init(sort: @escaping (Element, Element) -> Bool) {
        self.sort = sort
    }

    init(sort: @escaping (Element, Element) -> Bool, elements: [Element] = []) {
        self.sort = sort
        self.elements = elements
        
        if !elements.isEmpty {
            for i in stride(from: elements.count / 2 - 1, through: 0, by: -1) {
                siftDown(from: i)
            }
        } 
    }

    var isEmpty: Bool {
        elements.isEmpty
    }

    var count: Int {
        elements.count
    }
    
    func peek() -> Element? {
        elements.first
    }

    func leftChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 1
    }
    
    func rightChildIndex(ofParentAt index: Int) -> Int {
        (2 * index) + 2
    }

    func parentIndex(ofChildAt index: Int) -> Int {
        (index - 1) / 2
    }

    mutating func remove() -> Element? {
        guard !isEmpty else { // 1
            return nil
        }
        elements.swapAt(0, count - 1) // 2
        defer {
            siftDown(from: 0) // 4
        }
        return elements.removeLast() // 3
    }

    mutating func siftDown(from index: Int) {
        var parent = index
        while true {
            let left = leftChildIndex(ofParentAt: parent)
            let right = rightChildIndex(ofParentAt: parent)
            var candidate = parent

            if left < count && sort(elements[left], elements[candidate]) {
                candidate = left
            }

            if right < count && sort(elements[right], elements[candidate]) {
                candidate = right
            }

            if candidate == parent {
                return
            }

            elements.swapAt(parent, candidate)
            parent = candidate
        }
    }

    mutating func insert(_ element: Element) {
        elements.append(element)
        siftUp(from: elements.count - 1)
    }
    
    mutating func siftUp(from index: Int) {
        var child = index
        var parent = parentIndex(ofChildAt: child)
        
        while child > 0 && sort(elements[child], elements[parent]) {
            elements.swapAt(child, parent)
            child = parent
            parent = parentIndex(ofChildAt: child)
        } 
    }

    mutating func remove(at index: Int) -> Element? {
        guard index < elements.count else {
            return nil
        }
        
        if index == elements.count - 1 {
            return elements.removeLast()
        } else {
            elements.swapAt(index, elements.count - 1)
            
            defer {
                siftDown(from: index)
                siftUp(from: index)
            }

            return elements.removeLast()
        }
    }

    func index(of element: Element, startingAt i: Int) -> Int? {
        if i >= count {
            return nil
        }
        
        if sort(element, elements[i]) {
            return nil
        }
        
        if element == elements[i] {
            return i
        }

        if let j = index(of: element, startingAt: leftChildIndex(ofParentAt: i)) {
            return j
        }

        if let j = index(of: element, startingAt: rightChildIndex(ofParentAt: i)) {
            return j
        }
        
        return nil
    }
}
