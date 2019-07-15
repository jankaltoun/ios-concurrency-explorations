import Foundation

var array = [Int]()

let fillArray = {
    for i in 1...1000 {
        array.append(i)
    }
    
    print("❤️", array.count)
}

let firstThread = Thread(block: fillArray)
let secondThread = Thread(block: fillArray)

firstThread.start()
secondThread.start()
