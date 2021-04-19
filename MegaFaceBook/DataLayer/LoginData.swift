//
//  LoginData.swift
//  MegaFaceBook
//
//  Created by Алексей Сергейцев on 4/17/21.
//

import Foundation

struct Person {
    let login: String
    let password: String
    let user: User
    
    static func getPersonData() -> Person {
        Person(
            login: "12",
            password: "23",
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
        User(name: "Admin", surname: "Administrator", image: "SwiftImage")
    }
}


