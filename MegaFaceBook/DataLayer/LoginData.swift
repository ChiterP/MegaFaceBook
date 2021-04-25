//
//  LoginData.swift
//  MegaFaceBook
//
//  Created by Алексей Сергейцев on 4/17/21.
//


struct User {
    var login: String
    var password: String
    var email: String
    var person: Person
    
    static func getUserData() -> User {
        User(
            login: "User",
            password: "Password",
            email: "swift@trudniy.ru",
            person: Person.getPerson()
        )
    }
}

struct Person {
    var name: String
    var lastName: String
    var aboutUser: String
    var image: String
    
    var fullName: String {
        "\(name) \(lastName)"
    }
    
    static func getPerson() -> Person {
        Person(name: "Clark", lastName: "Kent", aboutUser: "Great man in small town", image: "")
    }
}
