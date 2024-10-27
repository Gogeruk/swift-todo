import Foundation

print("Swift Docker - All Good!")
print("\n\n\n")


var myTask = TodoItem()
//print(myTask.getTitle())


myTask.setTitle(title: "Test 2")
//print(myTask.getTitle())

var myTaskTwo = TodoItem()

var arrayOfTasks = [
    myTask,
    myTaskTwo
]


/////////////////
//let currentPath = FileManager.default.currentDirectoryPath
//print(currentPath)
//let currentPathURL = URL(fileURLWithPath: currentPath).appendingPathComponent("todos.json")
//print(currentPathURL)


/////////////////
let encoder = JSONEncoder()
encoder.outputFormatting = .prettyPrinted


let fileManager = TodoFileManager()




do {
    // check if exists
    try fileManager.initializeFileIfNeeded()

    // save
    try fileManager.saveTasksToJsonFile(
        arrayOfTodoItemObjects: arrayOfTasks
    )

    // list
    let data = try fileManager.loadTasksToObjects()

    let jsonMyTask = try encoder.encode(data)
    let jsonStringMyTask = String(data: jsonMyTask, encoding: .utf8)

    print(jsonStringMyTask ?? "Fail")
} catch {
    print("EXPLOSION!")
}






print("\n\n\n")