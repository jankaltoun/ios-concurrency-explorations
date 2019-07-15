import Foundation

var lock = NSLock()

var sharedValue = "initial"

let updateValue = { (value: String) -> Void in
    lock.lock()
    
    print("✍🏻 Writing value: \(value)")
    
    sharedValue = value
    
    guard sharedValue == value else {
        print("❌ Unexpected value: expected \"\(value)\", got \(sharedValue).")
        
        return
    }
    
    print("👀 OK: \(value)")
    
    lock.unlock()
}

let first = {
    for _ in 1..<10 {
        updateValue("first")
    }
}

let second = {
    for _ in 1..<10 {
        updateValue("second")
    }
}

let firstThread = Thread(block: first)
let secondThread = Thread(block: second)

firstThread.start()
secondThread.start()
