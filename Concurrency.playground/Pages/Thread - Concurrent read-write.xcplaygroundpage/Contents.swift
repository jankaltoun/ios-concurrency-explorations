import Foundation

var accountBalance = 1000

let calculateInterests = {
    for _ in 1...5 {
        accountBalance += 100
        print("✍🏻 WRITE: \(accountBalance)")
        
        Thread.sleep(forTimeInterval: 1)
    }
}

let readAccountBalance = {
    print("👀 READ: \(accountBalance)")
}

let calculatingThread = Thread(block: calculateInterests)
let readingThread = Thread(block: readAccountBalance)

calculatingThread.start()

Thread.sleep(forTimeInterval: 1)

readingThread.start()
