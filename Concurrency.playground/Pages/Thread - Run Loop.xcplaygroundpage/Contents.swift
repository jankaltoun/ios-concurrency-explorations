import Foundation

let block = {
    let timer = Timer(timeInterval: 1, repeats: true) { _ in
        print("❤️ Beep boop.")
    }
    
    RunLoop.current.add(timer, forMode: RunLoop.Mode.default)
    
    RunLoop.current.run()
}

let thread = Thread(block: block)

thread.start()
