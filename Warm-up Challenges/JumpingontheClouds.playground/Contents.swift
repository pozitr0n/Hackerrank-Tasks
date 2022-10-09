import Foundation

/*
 * Complete the 'jumpingOnClouds' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts INTEGER_ARRAY c as parameter.
 */

func jumpingOnClouds(c: [Int]) -> Int {

    var countOfOperations: Int = 0
    let lastIndex: Int = c.count - 1
    var tempIndex: Int = 0
    
    for currCount in 0...lastIndex {
        
        if currCount != tempIndex {
            continue
        }
        
        if currCount + 2 <= lastIndex {
            
            if c[currCount + 2] == 0 {
            
                countOfOperations += 1
                tempIndex += 2
                continue
                
            }
            
        }
        
        if currCount + 1 <= lastIndex {
        
            if c[currCount + 1] == 0 {
            
                countOfOperations += 1
                tempIndex += 1
                continue
                
            }
            
        }
        
    }
    
    return countOfOperations
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let cTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let c: [Int] = cTemp.split(separator: " ").map {
    if let cItem = Int($0) {
        return cItem
    } else { fatalError("Bad input") }
}

guard c.count == n else { fatalError("Bad input") }

let result = jumpingOnClouds(c: c)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)

