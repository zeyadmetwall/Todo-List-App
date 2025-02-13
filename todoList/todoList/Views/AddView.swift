//
//  AddView.swift
//  todoList
//
//  Created by Mai Nguyen on 12/2/25.
//

import SwiftUICore
import SwiftUI
struct AddView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var textField : String = ""
    @State var alertTitle: String = ""
    @State var showAlret: Bool = false
    var body: some View {
        ScrollView{
            VStack {
                TextField("Type spmething here...", text: $textField)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color.gray.opacity(0.2)) 
                    .cornerRadius(10)
                Button(action : pressButton ,label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.pink)
                        .cornerRadius(10)
                })
                .padding(14)
            }
            .navigationTitle("Add an Item🧣")
            .alert(isPresented: $showAlret, content: getAlert)
        }
    }
    func pressButton(){
        if textislong(){
            listViewModel.addItem(title: textField)
            presentationMode.wrappedValue.dismiss()
        }
    }
    func textislong () ->Bool{
        if (textField.count) < 3 {
            alertTitle = "Your new todo item must be at least 3 characters long please!🙀"
            showAlret.toggle()
            return false
        }
            return true
    }
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}


struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            AddView()
        }
        .environmentObject(ListViewModel())
    }
}

