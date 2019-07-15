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

var lastOperation: PrintAndWaitOperation?

for i in 1...10 {
    let beepOperation = PrintAndWaitOperation(value: "❤️ Beep \(i)")
    let boopOperation = PrintAndWaitOperation(value: "🖤 Boop \(i)")
    
    if let lastOperation = lastOperation {
        beepOperation.addDependency(lastOperation)
    }
    boopOperation.addDependency(beepOperation)
    
    queue.addOperation(beepOperation)
    queue.addOperation(boopOperation)
    
    lastOperation = boopOperation
}

queue.isSuspended = false

queue.waitUntilAllOperationsAreFinished()

print("✅ All work done.")
