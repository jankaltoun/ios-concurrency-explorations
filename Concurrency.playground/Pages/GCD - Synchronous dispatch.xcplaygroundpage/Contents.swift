import Foundation
import Dispatch

for i in 1...10 {
    DispatchQueue.global().sync {
        print("❤️ Work dispatched as \(i) executed on Thread: \(Thread.current).")
    }
}

/*DispatchQueue.main.sync {
    print("TEST")
}*/
