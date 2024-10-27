import Foundation

class TodoFileManager {
    private let fileURL: URL = {
        let currentPath = FileManager.default.currentDirectoryPath
        return URL(fileURLWithPath: currentPath).appendingPathComponent("todos.json")
    }()

    internal func saveTasksToJsonFile(arrayOfTodoItemObjects: [TodoItem]) throws {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        let data = try encoder.encode(arrayOfTodoItemObjects)
        try data.write(to: fileURL)
    }

    internal func loadTasksToObjects() throws -> [TodoItem] {
        let data = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        return try decoder.decode([TodoItem].self, from: data)
    }

    internal func initializeFileIfNeeded() throws {
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            try saveTasksToJsonFile(arrayOfTodoItemObjects: [])
        }
    }
}