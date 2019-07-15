import Foundation

var redThread: Thread?
var blackThread: Thread?

let redHeart = {
    for i in 1...100 {
        if Thread.current.isCancelled {
            Thread.exit()
        }
        
        print("❤️", i)
    }
}

let blackHeart = {
    for i in 1...100 {
        if i == 50 {
            redThread?.cancel()
        }
        print("🖤", i)
    }
}

redThread = Thread(block: redHeart)
redThread!.qualityOfService = .background

blackThread = Thread(block: blackHeart)
blackThread!.qualityOfService = .userInteractive

redThread!.start()
blackThread!.start()
