class Item: Equatable {
    var food: String
    var cuisine: String
    var rating: Int
    var thombstone: Bool

    init(food: String, cuisine: String, rating: Int, thombstone: Bool) {
        self.food = food
        self.cuisine = cuisine
        self.rating = rating
        self.thombstone = thombstone
    }

    static func == (lhs: Item, rhs: Item) -> Bool {
        return lhs.food == rhs.food && lhs.cuisine == rhs.cuisine
            && lhs.rating == rhs.rating && lhs.thombstone == rhs.thombstone
    }
}

class FoodRatings {
    var itemsMap: [String:Item]
    var cuisinesMap: [String:PriorityQueue<Item>]

    init(_ foods: [String], _ cuisines: [String], _ ratings: [Int]) {
        itemsMap = [String:Item]()
        cuisinesMap = [String:PriorityQueue<Item>]()

        for i in 0..<foods.count {
            let item = Item(food: foods[i], cuisine: cuisines[i], rating: ratings[i], thombstone: false)

            itemsMap[item.food] = item

            if cuisinesMap[item.cuisine] == nil {
                var pq = PriorityQueue<Item>(sort: { 
                    $0.rating == $1.rating 
                    ? $0.food < $1.food 
                    : $0.rating > $1.rating 
                })
                cuisinesMap[item.cuisine] = pq
            }

            cuisinesMap[item.cuisine]!.enqueue(item)
        }
    }
    
    func changeRating(_ food: String, _ newRating: Int) {
        var newItem = Item(
            food: itemsMap[food]!.food,
            cuisine: itemsMap[food]!.cuisine,
            rating: newRating, 
            thombstone: false)

        itemsMap[food]!.thombstone = true

        cuisinesMap[newItem.cuisine]!.enqueue(newItem)
        itemsMap[food] = newItem
    }
    
    func highestRated(_ cuisine: String) -> String {
        while cuisinesMap[cuisine]!.peek!.thombstone {
            cuisinesMap[cuisine]!.dequeue()
        }
        
        return cuisinesMap[cuisine]!.peek!.food
    }
}

/**
 * Your FoodRatings object will be instantiated and called as such:
 * let obj = FoodRatings(foods, cuisines, ratings)
 * obj.changeRating(food, newRating)
 * let ret_2: String = obj.highestRated(cuisine)
 */

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
