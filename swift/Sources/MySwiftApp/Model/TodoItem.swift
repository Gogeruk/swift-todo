import Foundation

struct TodoItem: Codable, Identifiable {
    let id: UUID
    var title: String?
    var completed: Bool = false

    mutating func toggleCompletion() {
        completed.toggle()
    }

    mutating func changeTitle(title: String? = nil) {
        self.title = title
    }

    init(
        id: UUID = UUID(),
        title: String,
        completed: Bool = false
    ) {
        self.id = id
        self.title = title
        self.completed = completed
    }
}

