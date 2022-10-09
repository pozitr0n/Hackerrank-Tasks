import Foundation

/*
 * Complete the 'sockMerchant' function below.
 *
 * The function is expected to return an INTEGER.
 * The function accepts following parameters:
 *  1. INTEGER n
 *  2. INTEGER_ARRAY ar
 */

func sockMerchant(n: Int, ar: [Int]) -> Int {
    
    var dictNumberOfRepetitions = [Int: Int]()
    var finalResult: Int = 0
    
    for count in 0...n - 1 {
        if dictNumberOfRepetitions[ar[count]] == nil {
            dictNumberOfRepetitions.updateValue(1, forKey: ar[count])
        } else {
            let tempIndex = dictNumberOfRepetitions[ar[count]]!
            dictNumberOfRepetitions.updateValue(tempIndex+1, forKey: ar[count])
        }
    }
    
    for (_, numberOfRepetitions) in dictNumberOfRepetitions {
        
        var quantityPairs: Int = 0
        quantityPairs = numberOfRepetitions / 2
        
        finalResult = finalResult + quantityPairs
    }
    
    return finalResult

}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

guard let arTemp = readLine()?.replacingOccurrences(of: "\\s+$", with: "", options: .regularExpression) else { fatalError("Bad input") }

let ar: [Int] = arTemp.split(separator: " ").map {
    if let arItem = Int($0) {
        return arItem
    } else { fatalError("Bad input") }
}

guard ar.count == n else { fatalError("Bad input") }

let result = sockMerchant(n: n, ar: ar)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
