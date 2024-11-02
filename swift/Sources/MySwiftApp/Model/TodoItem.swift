import Foundation

struct TodoItem: Codable, Identifiable {
    internal var id: UUID        = UUID()
    internal var title: String   = "Untitled"
    internal var completed: Bool = false

    mutating internal func getId() -> UUID {
        self.id
    }

    mutating internal func toggleCompletion() {
        completed.toggle()
    }

    mutating internal func getCompletion() -> Bool {
        self.completed
    }

    mutating internal func setTitle(title: String) {
        self.title = title
    }

    internal func getTitle() -> String {
        return self.title
    }
}