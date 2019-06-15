import Vapor

public func routes(_ router: Router) throws {

    router.get { req in
        return "It works!"
    }

    router.get("hello", "nakarin") { req -> String in
        return "Hello, nakarin!"
    }

    let todoController = TodoController()
    router.get("todos", use: todoController.index)
    router.get("todos", Todo.parameter, use: todoController.show)
    router.post("todos", use: todoController.create)
    router.put("todos", Todo.parameter, use: todoController.update)
    router.delete("todos", Todo.parameter, use: todoController.delete)
}
