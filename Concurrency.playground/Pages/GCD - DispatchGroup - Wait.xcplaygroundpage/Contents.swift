import Foundation
import Dispatch

let serialQueue = DispatchQueue(label: "test.queue.serial")
let concurrentQueue = DispatchQueue(label: "test.queue.concurrent", attributes: .concurrent)

let dispatchGroup = DispatchGroup()

dispatchGroup.enter()

serialQueue.async {
    Thread.sleep(forTimeInterval: 1)
    
    print("❤️ First work done.")
    
    dispatchGroup.leave()
}

dispatchGroup.enter()

concurrentQueue.async {
    Thread.sleep(forTimeInterval: 2)
    
    print("🖤 Second work done.")
    
    dispatchGroup.leave()
}

dispatchGroup.wait()

print("🤖 is blocked.")

print("✅ All work done.")
