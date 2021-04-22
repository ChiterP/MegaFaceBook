//
//  LoginData.swift
//  MegaFaceBook
//
//  Created by Алексей Сергейцев on 4/17/21.
//

import Foundation

struct Person {
    var name: String
    var lastName: String
    var email: String
    var login: String
    var password: String
    var aboutUser: String
    var user: User
    
    static func getPersonData() -> Person {
        Person(
            name: "",
            lastName: "",
            email: "",
            login: "12",
            password: "23",
            aboutUser: "",
            user: User.getUser()
        )
    }
}

struct User {
    let name: String
    let surname: String
    let image: String
    
    var fullName: String {
        "\(name) \(surname)"
    }
    
    static func getUser() -> User {
        User(
            name: "Admin",
            surname: "Administrator",
            image: "SwiftImage"
        )
    }
}


