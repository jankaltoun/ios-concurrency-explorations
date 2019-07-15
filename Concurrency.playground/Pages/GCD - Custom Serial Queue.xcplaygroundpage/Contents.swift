import Foundation
import Dispatch

let serialQueue = DispatchQueue(label: "test.queue")

for i in 1...5 {
    serialQueue.async {
        print("❤️ Async dispatch: \(i) started on thread \(Thread.current).")
        Thread.sleep(forTimeInterval: 1)
        print("❤️ Async dispatch: \(i) done.")
    }
}

for i in 1...5 {
    serialQueue.sync {
        print("🖤 Sync dispatch: \(i) started on thread \(Thread.current).")
        Thread.sleep(forTimeInterval: 1)
        print("🖤 Sync dispatch: \(i) done.")
    }
}
