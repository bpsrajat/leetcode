import UIKit

class Solution {
    func kClosest(_ points: [[Int]], _ K: Int) -> [[Int]] {

        var index: [Int:Int] = [:]
        var result: [[Int]] = []
        var count = 0
        
        for point in points {
            index[count] = point[0]*point[0] + point[1]*point[1]
           count += 1
        }
         debugPrint(index)
       
        let sortedByValueDictionary = index.sorted { $0.1 < $1.1 }
        debugPrint(sortedByValueDictionary)
        for (k,_) in sortedByValueDictionary {
            if result.count == K {
                break
            }
            result.append(points[k])
        }
        
        return result
    }
}

debugPrint(Solution().kClosest([[3,5],[0,1],[1,0]], 2))

