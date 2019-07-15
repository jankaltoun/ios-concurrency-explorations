import Dispatch

let workItem = DispatchWorkItem {
    print("❤️ Beep boop, I'm a happy 🤖.")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: workItem)
