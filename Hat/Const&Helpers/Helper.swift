import Foundation

class Helper {
    static func move(str: String, from: inout [String], to: inout [String]) {
        if let index = from.firstIndex(of: str) {
            from.remove(at: index)
            to.append(str)
        }
    }
    static func plistFileName(_ fileName: String) -> String {
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory,FileManager.SearchPathDomainMask.allDomainsMask, true)
        return paths[0].appending("/"+fileName+".plist")
    }
}