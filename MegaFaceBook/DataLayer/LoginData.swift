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
    let authInfo: AuthInfo
}

struct AuthInfo {
    let login: String
    let pass: String
}