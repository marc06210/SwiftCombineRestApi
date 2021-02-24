//
//  PostModel.swift
//  TestApi
//
//  Created by Marc Guerrini on 22/02/2021.
//

import Foundation

struct Post: Identifiable, Decodable {
    var id: Int
    var title: String
    var body: String
}

var donneesTest: [Post] = [
    Post(id: 1, title: "titre-1", body: "body-1"),
    Post(id: 1, title: "titre-2", body: "body-2"),
    Post(id: 1, title: "titre-3", body: "body-3"),
    Post(id: 4, title: "titre-4", body: "body-4")
]
