import Foundation
import Dispatch

for i in 1...10 {
    DispatchQueue.global().async {
        print("❤️ Work dispatched as \(i) executed on Thread: \(Thread.current).")
    }
}
