import Foundation

class PrintAndWaitOperation: Operation {
    var value: String
    
    init(value: String) {
        self.value = value
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        print(value)
        
        Thread.sleep(forTimeInterval: 0.5)
    }
}

var queue = OperationQueue()
queue.isSuspended = true
queue.maxConcurrentOperationCount = 20

for i in 1...10 {
    let beepOperation = PrintAndWaitOperation(value: "❤️ Beep \(i)")
    beepOperation.qualityOfService = .userInteractive
    
    let boopOperation = PrintAndWaitOperation(value: "🖤 Boop \(i)")
    boopOperation.qualityOfService = .background
    
    queue.addOperation(beepOperation)
    queue.addOperation(boopOperation)
}

queue.isSuspended = false

queue.waitUntilAllOperationsAreFinished()

print("✅ All work done.")
