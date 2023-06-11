class SnapshotArray {
    private let len: Int
    private var map = [Int:Int]()
    private var cache = [Int:[Int:Int]]()
    private var id = 0

    init(_ length: Int) {
        len = length
    }
    
    func set(_ index: Int, _ val: Int) {
        if index < 0 || index >= len {
            return
        }

        map[index] = val
    }
    
    func snap() -> Int {
        defer { id += 1 }

        cache[id] = map

        return id
    }
    
    func get(_ index: Int, _ snap_id: Int) -> Int {
        cache[snap_id]![index] ?? 0
    }
}

/**
 * Your SnapshotArray object will be instantiated and called as such:
 * let obj = SnapshotArray(length)
 * obj.set(index, val)
 * let ret_2: Int = obj.snap()
 * let ret_3: Int = obj.get(index, snap_id)
 */
