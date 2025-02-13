//
//  todoListApp.swift
//  todoList
//
//  Created by Mai Nguyen on 11/2/25.
//

import SwiftUI
import SwiftData

@main
struct todoListApp: App {
    
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
