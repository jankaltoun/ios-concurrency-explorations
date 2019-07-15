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
let blackThread = Thread(block: blackHeart)

redThread.start()
blackThread.start()
