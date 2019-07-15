import Foundation

let lock = NSLock()

var array = [Int]()

let fillArray = {
    for i in 1...1000 {
        lock.lock()
        array.append(i)
        lock.unlock()
    }
    
    lock.lock()
    print("❤️", array.count)
    lock.unlock()
}

let firstThread = Thread(block: fillArray)
let secondThread = Thread(block: fillArray)

firstThread.start()
secondThread.start()
