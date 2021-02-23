//
//  TestApiApp.swift
//  TestApi
//
//  Created by Marc Guerrini on 22/02/2021.
//

import SwiftUI
// https://jsonplaceholder.typicode.com/posts
@main
struct TestApiApp: App {
    var body: some Scene {
        WindowGroup {
            ListOfPostsView(allPosts: PostApiViewModel(donneesTest))
        }
    }
}
