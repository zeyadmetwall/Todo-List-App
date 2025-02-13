//
//  ListView.swift
//  todoList
//
//  Created by Mai Nguyen on 11/2/25.
//

import SwiftUI

struct ListView: View {
   @EnvironmentObject var listViewModel: ListViewModel
//    @State var items: [ItemModel] = [
//        ItemModel(title: "this is the first title", isCompleted: false),
//        ItemModel(title: "this is second one", isCompleted: true)
//    ]
    var body: some View {
        List {
            ForEach(listViewModel.items) { item in
                ListRowView(item: item)
                    .onTapGesture {
                        withAnimation(.linear){
                            listViewModel.checkmark(item: item)
                        }
                    }
                
            }
            .onDelete(perform: listViewModel.deleteItem)
            .onMove(perform: listViewModel.moveItem)
                
            }
        
        .listStyle(PlainListStyle())
        .navigationTitle("Todo List📝")
//        .navigationBarTitle(Text("Todo List"), displayMode: .inline)
        .navigationBarItems(leading : EditButton(),
                            trailing:NavigationLink("Add", destination: AddView()))
    }
    
//    func deleteItem(indexset : IndexSet){
//        
//        items.remove(atOffsets :indexset)
//    }
//    func moveItem (from : IndexSet, to: Int){
//        items.move(fromOffsets: from, toOffset: to)
//    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}


