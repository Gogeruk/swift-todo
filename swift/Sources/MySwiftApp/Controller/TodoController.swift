import Foundation

class TodoController {


    @MainActor
    func handle(input: String) {

        // TODO: if you remove this it will return error
        // think out it more deeply...
        var arrayOfTodoItemObjects: [TodoItem]

        do {
            arrayOfTodoItemObjects = try fileManager.loadTasksToObjects()
        } catch {
            print("Error loading todos:", error)
            return
        }


        // TODO: complete CRED
        // TODO: analyze syntax...
       switch input {
        case "add":
            print("Not yet!")
            // ... implement add method
        case "list":
            print("Not yet!")
            // ... implement list method
        case "complete":
            print("Not yet!")
            // ... implement complete method
        case "delete":
            print("Not yet!")
            // ... implement delete method
        default:
            print("Unknown command")
        }



        // save everything after changes
        // or something....
        do {
            try fileManager.saveTasksToJsonFile(
                arrayOfTodoItemObjects: arrayOfTodoItemObjects
            )
        } catch {
            print("Error saving todos:", error)
        }
    }
}