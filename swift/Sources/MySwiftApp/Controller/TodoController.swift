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
            print("Enter the ID of the todo to mark as completed:")
            if let idString = readLine(), let id = UUID(uuidString: idString) {
                if let index = arrayOfTodoItemObjects.firstIndex(where: { $0.id == id }) {
                    arrayOfTodoItemObjects[index].completed.toggle()
                    print("Todo marked as completed!")

                    do {
                        try fileManager.saveTasksToJsonFile(arrayOfTodoItemObjects: arrayOfTodoItemObjects)
                    } catch {
                        print("Error saving todos:", error)
                        return
                    }
                } else {
                    print("Todo with this ID not found.")
                }
            } else {
                print("Invalid ID format.")
            }

        case "delete":
            print("Enter the ID of the todo to delete:")
            if let idString = readLine(), let id = UUID(uuidString: idString) {
                if let index = arrayOfTodoItemObjects.firstIndex(where: { $0.id == id }) {
                    arrayOfTodoItemObjects.remove(at: index)
                    print("Todo deleted!")

                    do {
                        try fileManager.saveTasksToJsonFile(arrayOfTodoItemObjects: arrayOfTodoItemObjects)
                    } catch {
                        print("Error saving todos:", error)
                        return
                    }
                } else {
                    print("Todo with this ID not found.")
                }
            } else {
                print("Invalid ID format.")
            }

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