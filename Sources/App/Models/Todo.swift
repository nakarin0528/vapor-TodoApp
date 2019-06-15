import FluentSQLite
import Vapor

/// A single entry of a Todo list.
final class Todo: SQLiteModel {
    var id: Int?        //unique
    var title: String
    var isFinished: Bool

    init(id: Int? = nil, title: String, isFinished: Bool) {
        self.id = id
        self.title = title
        self.isFinished = isFinished
    }
}

/// Allows `Todo` to be used as a dynamic migration.
extension Todo: Migration { }

/// Allows `Todo` to be encoded to and decoded from HTTP messages.
extension Todo: Content { }

/// Allows `Todo` to be used as a dynamic parameter in route definitions.
extension Todo: Parameter { }

extension Todo {
    static func dateFromString(_ dateAsString: String?) -> Date? {
        guard let string = dateAsString else { return nil }

        let dateformatter = DateFormatter()
        dateformatter.timeZone = TimeZone(identifier: "ja_JP")
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let value = dateformatter.date(from: string)
        return value
    }

    static func dateToString(_ dateIn: Date?) -> String? {
        guard let date = dateIn else { return nil }
        let dateformatter = DateFormatter()
        dateformatter.timeZone = TimeZone(identifier: "ja_JP")
        dateformatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let value = dateformatter.string(from: date)
        return value
    }
}
