//
//  TopViewModel.swift
//  Trade
//
//  Created by Алексей Баранов on 21.10.2023.
//

import Foundation

class TopViewModel: ObservableObject {
    @Published var user: UserModel = UserModel(id: 1, name: "Oliver", deposit: 2367, profit: 336755, cantry: "germany")
    @Published var users: [UserModel] = [
    UserModel(id: 1, name: "Oliver", deposit: 2367, profit: 336755, cantry: "usa"),
    UserModel(id: 2, name: "Jack", deposit: 1175, profit: 148389, cantry: "canada"),
    UserModel(id: 3, name: "Harry", deposit: 1000, profit: 113888, cantry: "brazil"),
    UserModel(id: 4, name: "Jacob", deposit: 999, profit: 36755, cantry: "japan"),
    UserModel(id: 5, name: "Charley", deposit: 888, profit: 18389, cantry: "germany"),
    UserModel(id: 6, name: "Tomas", deposit: 777, profit: 12000, cantry: "brazil"),
    UserModel(id: 7, name: "George", deposit: 666, profit: 11111, cantry: "france"),
    UserModel(id: 8, name: "Oscar", deposit: 555, profit: 9988, cantry: "england"),
    UserModel(id: 9, name: "James", deposit: 444, profit: 8877, cantry: "india"),
    UserModel(id: 10, name: "William", deposit: 333, profit: 6652, cantry: "spain"),
    ]
}
