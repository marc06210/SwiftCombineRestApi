//
//  PostModel.swift
//  TestApi
//
//  Created by Marc Guerrini on 22/02/2021.
//

import Foundation

struct PostStore {
    private(set) var posts: Array<Post>
    
    init(posts: [Post]) {
        self.posts = Array<Post>()
        for post in posts {
            self.posts.append(post)
        }
    }
    
    mutating func add(post element: Post) {
        self.posts.append(element)
    }
    
    struct Post: Identifiable, Decodable {
        var id: Int
        var title: String
        var body: String
    }
}

var donneesTest: [PostStore.Post] = [
    PostStore.Post(id: 1, title: "titre-1", body: "body-1"),
    PostStore.Post(id: 1, title: "titre-2", body: "body-2"),
    PostStore.Post(id: 1, title: "titre-3", body: "body-3"),
    PostStore.Post(id: 4, title: "titre-4", body: "body-4")
]
