import UIKit

class JsonHelper {
    var fileName: String
    
    init(_ fileName: String) {
        self.fileName = fileName
    }
    
    func getData() -> Array<[String: String]>
    {
        var json: Any?
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let fileUrl = URL(fileURLWithPath: path)
                let data = try Data(contentsOf: fileUrl, options: .mappedIfSafe)
                json = try? JSONSerialization.jsonObject(with: data)
            } catch {
                print("failed")
            }
        }
        return json as! Array<[String : String]>
    }
    
    func saveData(_ data: [String: String]) {
        var dataInFile = getData()
        dataInFile.append(data)
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let json = try JSONSerialization.data(withJSONObject: dataInFile, options: [.prettyPrinted])
                let fileUrl = URL(fileURLWithPath: path)
                try json.write(to: fileUrl)
            } catch {
                print("failed")
            }
        } else {
            print("no file path")
        }
    }
    func removeDataByIndex(_ index: Int) {
        var dataInFile = getData()
        dataInFile.sort(by: {$0["name"]! < $1["name"]!})
        dataInFile.remove(at: index)
        if let path = Bundle.main.path(forResource: fileName, ofType: "json") {
            do {
                let json = try JSONSerialization.data(withJSONObject: dataInFile, options: [.prettyPrinted])
                let fileUrl = URL(fileURLWithPath: path)
                try json.write(to: fileUrl)
            } catch {
                print("failed")
            }
            
        } else {
            print("no file path")
        }
    }
    
    
    
}
