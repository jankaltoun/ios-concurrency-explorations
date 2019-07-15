import Foundation
import Dispatch

let concurrentQueue = DispatchQueue(label: "test.queue", attributes: .concurrent)

for i in 1...10 {
    concurrentQueue.async {
        print("❤️ Async dispatch: \(i) started.")
        Thread.sleep(forTimeInterval: 1)
        print("❤️ Async dispatch: \(i) done.")
    }
}

for i in 1...10 {
    concurrentQueue.sync {
        print("🖤 Sync dispatch: \(i) started.")
        Thread.sleep(forTimeInterval: 1)
        print("🖤 Sync dispatch: \(i) done.")
    }
}
