//
//  PostApiViewModel.swift
//  TestApi
//
//  Created by Marc Guerrini on 22/02/2021.
//

import Foundation
import Combine

class PostApiViewModel: ObservableObject {
    @Published private var data: PostStore
    private let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
    private var task: AnyCancellable? = nil
    
    init(_ posts: [PostStore.Post]) {
        self.data = PostStore(posts: posts)
    }
    
    // MARK: - data access
    func getposts() -> Array <PostStore.Post> {
        data.posts
    }
    
    // MARK - intent
    func fetchData() -> Void {
        print("fetchData")
        
        let postRetriever = URLSession.shared.dataTaskPublisher(for: url)
        
        task?.cancel()
        
        task = postRetriever.sink { completion in
            switch(completion) {
            case .failure(let error):
                print("error: \(error.localizedDescription)")
            case .finished:
                break
            }
        } receiveValue: { response in
            print("receiveValue: \(response)")
            guard let posts = try? JSONDecoder().decode([PostStore.Post].self, from: response.data) else { return }
            DispatchQueue.main.async {
                self.data = PostStore(posts: posts)
            }
        }

    }
}
