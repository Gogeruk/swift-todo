import Foundation

print("Swift Docker - All Good!")

let fileManager = TodoFileManager()

do {
    try fileManager.initializeFileIfNeeded()
} catch {
    print("Error initializing file:", error)
}

let controller = TodoController()

while true {
    print("\n>>> ", terminator: "")
    guard let input = readLine() else { break }

    if input == "quit" || input == "q" {
        print("\n\n\nDONE!")
        break
    } else {
        controller.handle(input: input)
    }
}