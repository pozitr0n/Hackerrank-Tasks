import Foundation

/*
 * Complete the 'countingValleys' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER steps
 *  2. STRING path
 */

func countingValleys(steps: Int, path: String) -> Int {
    
    var countOfValues: Int = 0
    var isDown: Bool = false
    
    var countOfUp: Int = 0
    var countOfDown: Int = 0
    
    for character in path {
        
        if character == "U" {
            countOfUp += 1
        } else {
            
            if countOfDown == countOfUp && isDown == false {
                isDown = true
            }
                
            countOfDown += 1
        }
        
        if countOfDown == countOfUp && isDown == true {
            isDown = false
            countOfValues += 1
        }
        
    }
    
    return countOfValues

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let steps = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let path = readLine() else { fatalError("Bad input") }

let result = countingValleys(steps: steps, path: path)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
