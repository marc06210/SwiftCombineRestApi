//
//  PostApiViewModel.swift
//  TestApi
//
//  Created by Marc Guerrini on 22/02/2021.
//

import Foundation
import Combine

class PostApiViewModel: ObservableObject {
    @Published private var data: [Post]
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    private var task: AnyCancellable? = nil
    
    init(_ posts: [Post]) {
        self.data = posts
    }
    
    // MARK: - data access
    func getposts() -> Array <Post> {
        data
    }
    
    // MARK - intent
    func fetchData() -> Void {
        print("fetchData")
        
        let postRetriever = URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .flatMap { $0.publisher }
            .filter { $0.id%2==0 }
            .map { post -> Post in
                return Post(id: post.id, title: "MGU>>>"+post.title, body: post.body)
            }
            .collect()
            .replaceError(with: [])
            
        task?.cancel()
        
        task = postRetriever
            .receive(on: DispatchQueue.main)
            .sink { [weak self] posts in
                if !posts.isEmpty {
                    self?.data = posts
                }
            }
    }
}
