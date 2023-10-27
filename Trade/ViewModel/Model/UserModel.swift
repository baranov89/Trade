//
//  UserModel.swift
//  Trade
//
//  Created by Алексей Баранов on 21.10.2023.
//

import Foundation

struct UserModel: Identifiable {
    var id: Int
    var name: String
    var deposit: Int
    var profit: Int
    var cantry: String
}
