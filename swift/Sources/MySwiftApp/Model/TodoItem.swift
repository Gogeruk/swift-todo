import Foundation

struct TodoItem: Codable, Identifiable {
    internal var id: UUID        = UUID()
    private  var title: String   = "Untitled"
    private  var completed: Bool = false

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