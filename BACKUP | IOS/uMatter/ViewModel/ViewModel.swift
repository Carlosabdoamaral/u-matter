//
//  ViewModel.swift
//  uMatter
//
//  Created by Carlos Amaral on 24/06/22.
//

import Foundation

class ViewModel : ObservableObject {
    @Published var posts = [PostModel]()
    
    func loadPosts() async {
        let (data, _) = try! await URLSession.shared.data(from: URL(string:BackendUrlsClass().allPosts)!)
        let decodedResponse = try? JSONDecoder().decode([PostModel].self, from: data)
        posts = decodedResponse ?? []
        return
    }
}
