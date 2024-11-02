import Foundation

class TodoController {


    @MainActor
    func handle(input: String) {
        var arrayOfTodoItemObjects: [TodoItem]

        do {
            arrayOfTodoItemObjects = try fileManager.loadTasksToObjects()
        } catch {
            print("Error loading todos:", error)
            return
        }

       switch input {
        case "add":
                print("Enter the title for your new todo:")
                if let title = readLine(), title.isEmpty == false {
                    var newTodoItem = TodoItem()
                    newTodoItem.setTitle(title: title)
                    arrayOfTodoItemObjects.append(newTodoItem)

                    do {
                        try fileManager.saveTasksToJsonFile(
                            arrayOfTodoItemObjects: arrayOfTodoItemObjects
                        )
                    } catch {
                        print("Error saving todos:", error)
                        return
                    }

                    print("Saved!")
                } else {
                    print("No input!")
                }
        case "list":
            var arrayOfTodoItemObjects: [TodoItem]

            do {
                arrayOfTodoItemObjects = try fileManager.loadTasksToObjects()
            } catch {
                print("Error loading todos:", error)
                return
            }

            let encoder = JSONEncoder()
            encoder.outputFormatting = .prettyPrinted

            var result: Data

            do {
                result = try encoder.encode(arrayOfTodoItemObjects)
            } catch {
                print("Error encoding loaded todos:", error)
                return
            }

            if let result = String(data: result, encoding: .utf8) {
                print("Your Todos:\n\(result)")
            } else {
                print("Failed to convert JSON data to string.")
            }
        case "complete":
            print("Not yet!")
            // ... implement complete method
        case "delete":
            print("Not yet!")
            // ... implement delete method
        default:
            print("Unknown command")
        }

        do {
            try fileManager.saveTasksToJsonFile(
                arrayOfTodoItemObjects: arrayOfTodoItemObjects
            )
        } catch {
            print("Error saving todos:", error)
        }
    }
}