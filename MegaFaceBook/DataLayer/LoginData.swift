//
//  LoginData.swift
//  MegaFaceBook
//
//  Created by Алексей Сергейцев on 4/17/21.
//

import Foundation


struct Person {
    let name: String
    let surname: String
    let login: String
    let pass: String
//    let authInfo: AuthInfo
}

//struct AuthInfo {
//
//}


extension Person {
    static func getPerson() -> [Person] {
        [
            Person(name: "Alberto ", surname: "Ruiz", login: "admin", pass: "admin")
        ]
    }
}


