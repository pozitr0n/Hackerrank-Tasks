import Foundation

/*
 * Complete the 'repeatedString' function below.
 *
 * The function is expected to return a LONG_INTEGER.
 * The function accepts following parameters:
 *  1. STRING s
 *  2. LONG_INTEGER n
 */

func repeatedString(s: String, n: Int) -> Int {
    
    if s.count <= 0 || n <= 0 {
        return 0
    }
    
    if s.count == 1 {
        if s != "a" {
            return 0
        }
        return n
    }
    
    if n == 1 {
        if s.components(separatedBy: "a").count - 1 > 0  {
            return s.components(separatedBy: "a").count - 1
        } else {
            return 0
        }
    }
    
    let strCount = s.components(separatedBy: "a").count - 1
    if strCount <= 0 {
         return 0
    }
    
    var times = n / s.count
    times *= strCount
    
    var balance = n % s.count
    var i = 0

    while balance > 0 {
        
        let strr = s[s.index(s.startIndex, offsetBy: i)]
        if strr == "a" {
            times += 1
        }
        balance -= 1
        i += 1
    }
    return times
   
}

let stdout = ProcessInfo.processInfo.environment["OUTPUT_PATH"]!
FileManager.default.createFile(atPath: stdout, contents: nil, attributes: nil)
let fileHandle = FileHandle(forWritingAtPath: stdout)!

guard let s = readLine() else { fatalError("Bad input") }

guard let n = Int((readLine()?.trimmingCharacters(in: .whitespacesAndNewlines))!)
else { fatalError("Bad input") }

let result = repeatedString(s: s, n: n)

fileHandle.write(String(result).data(using: .utf8)!)
fileHandle.write("\n".data(using: .utf8)!)
