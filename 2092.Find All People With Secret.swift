class Solution {
    func findAllPeople(_ n: Int, _ meetings: [[Int]], _ firstPerson: Int) -> [Int] {
        let meets = meetings.sorted { $0[2] < $1[2] }

        // print(meets)

        var uf = UnionFind(size: n)
        uf.union(0, firstPerson)

        var i = 0
        while i < meets.count {
            let time = meets[i][2]
            var candidates = Set<Int>()

            while i < meets.count, time == meets[i][2] {
                uf.union(meets[i][0], meets[i][1])
                
                candidates.insert(meets[i][0])
                candidates.insert(meets[i][1])

                i += 1
            }

            for c in candidates {
                if !uf.connected(0, c) {
                    uf.clear(c)
                }
            }
        }

        var res = [Int]()

        for i in 0..<n {
            if uf.connected(0, i) {
                res.append(i)
            }
        }

        return res
    }
}

class UnionFind {
    // The number of elements in this union find
    private(set) var size: Int

    // Used to track the size of each of the component
    private var sz: [Int]

    // id[i] points to the parent of i, if id[i] = i then i is a root node
    private var id: [Int]

    // Tracks the number of components in the union find
    private(set) var numComponents: Int

    init(size: Int) {
        // if (size <= 0) throw new IllegalArgumentException("Size <= 0 is not allowed");

        self.size = size
        self.numComponents = size
      
        sz = Array(repeating: 0, count: size) // new int[size];
        id = Array(repeating: 1, count: size) //new int[size];
      
        for i in 0..<size {
            id[i] = i
            sz[i] = 1
        }
    }

    // Find which component/set 'p' belongs to, takes amortized constant time.
    public func find(_ p: Int) -> Int {
        var p = p
        // Find the root of the component/set
        var root = p;
        while (root != id[root]) {
            root = id[root]
        }

        // Compress the path leading back to the root.
        // Doing this operation is called "path compression"
        // and is what gives us amortized time complexity.
        while p != root {
            let next = id[p]
            id[p] = root
            p = next
        }

        return root
    }

    // This is an alternative recursive formulation for the find method
    public func findRecursive(_ p: Int) -> Int {
        if p == id[p] {
            return p
        }

        id[p] = find(id[p])
        
        return id[p]
    }

    // Return whether or not the elements 'p' and
    // 'q' are in the same components/set.
    public func connected(_ p: Int, _ q: Int) -> Bool {
        find(p) == find(q)
    }

    // Unify the components/sets containing elements 'p' and 'q'
    public func union(_ p: Int, _ q: Int) {
        // These elements are already in the same group!
        if (connected(p, q)) {
            return
        }

        let root1 = find(p);
        let root2 = find(q);

        // Merge smaller component/set into the larger one.
        if (sz[root1] < sz[root2]) {
        sz[root2] += sz[root1];
        id[root1] = root2;
        sz[root1] = 0;
        } else {
        sz[root1] += sz[root2];
        id[root2] = root1;
        sz[root2] = 0;
        }

        // Since the roots found are different we know that the
        // number of components/sets has decreased by one
        numComponents -= 1
    }

    public func clear(_ p: Int) {
        id[p] = p
        sz[p] = 0
    }
}
