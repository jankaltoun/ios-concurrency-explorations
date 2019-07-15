import Foundation
import Dispatch

let mainQueue = DispatchQueue.main
let userInteractiveQueue = DispatchQueue.global(qos: .userInteractive)
let userInitiatedQueue = DispatchQueue.global(qos: .userInitiated)
let utilityQueue = DispatchQueue.global(qos: .utility)
let backgroundQueue = DispatchQueue.global(qos: .background)

for i in 1...1000 {
    backgroundQueue.async {
        print("💜 Background: \(i).")
    }
    
    utilityQueue.async {
        print("💙 Utility: \(i).")
    }
    
    userInitiatedQueue.async {
        print("💚 User initiated: \(i).")
    }
    
    userInteractiveQueue.async {
        print("🧡 User interactive: \(i).")
    }
    
    mainQueue.async {
        print("❤️ Main: \(i).")
    }
}
