//
//  PostApiViewModel.swift
//  TestApi
//
//  Created by Marc Guerrini on 22/02/2021.
//

import Foundation

class PostApiViewModel: ObservableObject {
    @Published private var data: PostStore
    
    init(_ posts: [PostStore.Post]) {
        self.data = PostStore(posts: posts)
    }
    
    // MARK: - data access
    func getposts() -> Array <PostStore.Post> {
        data.posts
    }
}
