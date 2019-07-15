import Foundation

let redHeart = {
    for i in 1...100 {
        print("❤️", i)
    }
}

let blackHeart = {
    for i in 1...100 {
        print("🖤", i)
    }
}

let redThread = Thread(block: redHeart)
redThread.qualityOfService = .background

let blackThread = Thread(block: blackHeart)
blackThread.qualityOfService = .userInteractive

redThread.start()
blackThread.start()
