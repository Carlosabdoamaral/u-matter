//
//  PostDetailsView.swift
//  uMatter
//
//  Created by Carlos Amaral on 25/06/22.
//

import SwiftUI

struct PostDetailsView: View {
    @State private var didReacted : Bool = false
    @State private var showingAlert : Bool = false
    
    var p : PostModel
    
    var body: some View {
        VStack {
            List {
                Section {
                    Text(p.title)
                } header: {
                    Text("Título")
                }
                
                Section {
                    Text(p.content)
                } header: {
                    Text("Descrição")
                }
            }
            .navigationTitle("#\(p.post_id)")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItemGroup(placement: ToolbarItemPlacement.navigationBarTrailing) {
                    Button {
                        self.showingAlert = true
                    } label: {
                        Image(systemName: didReacted ? "heart.fill" : "heart")
                            .foregroundColor(.red)
                    }
                }
            }
        }
        .alert(isPresented:$showingAlert) {
            Alert(
//                MARK: EXAMPLE
//                title: Text("Are you sure you want to delete this?"),
//                message: Text("There is no undo"),
//                primaryButton: .destructive(Text("Delete")) {
//                    print("Deleting...")
//                },
//                secondaryButton: .cancel()
                
                title: Text("Muito Obrigado!"),
                
                message: Text("Você acabou de melhorar o dia de uma pessoa"),
                
                primaryButton: .destructive(Text("Cancelar"), action: {
                    self.didReacted = false
                }),
                
                secondaryButton:.default(Text("Salvar"), action: {
                    self.didReacted = true
                })
            )
        }
        
    }
}

struct PostDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailsView(
            p: PostModel(post_id: 1, title: "Teste show", content: "este é apenas um template para o preview functionar direitinho", date: "Data-data", reactions: 102, views: 100)
        )
    }
}
