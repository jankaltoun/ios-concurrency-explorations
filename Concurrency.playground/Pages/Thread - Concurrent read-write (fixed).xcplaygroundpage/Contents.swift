import Foundation

var lock = NSLock()

var accountBalance = 1000

let calculateInterests = {
    lock.lock()
    
    for _ in 1...5 {
        accountBalance += 100
        print("✍🏻 WRITE: \(accountBalance)")
        
        Thread.sleep(forTimeInterval: 1)
    }
    
    lock.unlock()
}

let readAccountBalance = {
    lock.lock()
    
    print("👀 READ: \(accountBalance)")
    
    lock.unlock()
}

let calculatingThread = Thread(block: calculateInterests)
let readingThread = Thread(block: readAccountBalance)

calculatingThread.start()

Thread.sleep(forTimeInterval: 1)

readingThread.start()
