class Solution {
    func floodFill(_ image: [[Int]], _ sr: Int, _ sc: Int, _ color: Int) -> [[Int]] {
        var image = image
        fill(&image, sr, sc, image[sr][sc], color)
        return image
    }
    
    private func fill(_ img: inout [[Int]], _ r: Int, _ c: Int, _ orig: Int, _ col: Int) {
        if r < 0 || r >= img.count || c < 0 || c >= img[0].count {
            return
        }
        
        if img[r][c] == col {
            return
        }
        
        if img[r][c] == orig {
            img[r][c] = col
            fill(&img, r, c-1, orig, col) // left
            fill(&img, r-1, c, orig, col) // top
            fill(&img, r, c+1, orig, col) // right
            fill(&img, r+1, c, orig, col) // bottom
        }
    }
}
