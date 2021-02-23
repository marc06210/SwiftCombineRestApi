//
//  ListOfPostsView.swift
//  TestApi
//
//  Created by Marc Guerrini on 22/02/2021.
//

import SwiftUI

struct ListOfPostsView: View {
    
    @ObservedObject var allPosts: PostApiViewModel
    
    var body: some View {
        List {
            ForEach(allPosts.getposts()) { onePost in
                HStack {
                    Text(String(onePost.id))
                        .font(.title)
                    VStack(alignment: .leading) {
                        Text(onePost.title)
                            .font(.headline)
                        Text(onePost.body.prefix(80))
                            .font(.subheadline)
                    }
                }
            }
        }
        .onAppear {
            allPosts.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfPostsView(allPosts: PostApiViewModel(donneesTest))
    }
}
