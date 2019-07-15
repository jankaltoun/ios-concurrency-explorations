import Foundation

let redHeart = {
    for i in 1...100 {
        if i > 5 {
            Thread.exit()
        }
        
        print("❤️", i)
    }
}

let blackHeart = {
    for i in 1...100 {
        if i > 10 {
            Thread.exit()
        }
        
        print("🖤", i)
    }
}

let redThread = Thread(block: redHeart)
let blackThread = Thread(block: blackHeart)

redThread.start()
blackThread.start()
