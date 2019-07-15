import Foundation

var sharedValue = "initial"

let updateValue = { (value: String) -> Void in
    print("✍🏻 Writing value: \(value)")
    
    sharedValue = value
    
    Thread.sleep(forTimeInterval: 0.1)
    
    guard sharedValue == value else {
        print("❌ Unexpected value: expected \"\(value)\", got \(sharedValue).")
        
        return
    }
    
    print("👀 OK: \(value)")
}

let first = {
    for _ in 1...10 {
        updateValue("first")
    }
}

let second = {
    for _ in 1...10 {
        updateValue("second")
    }
}

let firstThread = Thread(block: first)
let secondThread = Thread(block: second)

firstThread.start()
secondThread.start()
