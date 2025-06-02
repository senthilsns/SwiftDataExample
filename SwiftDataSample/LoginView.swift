//
//  ContentView.swift
//  SwiftDataSample
//
//  Created by senthil on 02/06/25.
//

import SwiftUI
import SwiftData

struct LoginView: View {
    
    // swiftData
    @Environment(\.modelContext) private var context
    @Query private var items: [DataItem]
  
    @StateObject private var viewModel = LoginViewModel()
    @State private var showingAlert: Bool = false

    var body: some View {
        VStack() {
                  
            TextField("Enter username", text: $viewModel.username)
                .keyboardType(.emailAddress)
                .textFieldStyle(.roundedBorder)
            
            
            SecureField("Enter Password", text:$viewModel.password)
                .textFieldStyle(.roundedBorder)
            
            Button{
                if viewModel.username.isEmpty || viewModel.password.isEmpty {
                    showingAlert = true
                }else{
                    
                   addItem(username: $viewModel.username, password: $viewModel.password)
                    // Clear Textfield
                    self.viewModel.username = ""
                    self.viewModel.password = ""
                    
                }
                    
            }label: {
                Text("Save")
                    .font(.title3)
                    .bold(true)
            }
            .alert("Please type username and password", isPresented: $showingAlert) {
                      Button("OK", role: .cancel) { }
                  }
            .padding(15)
            .background(.gray)
            .cornerRadius(8)
            .foregroundColor(.white)
            
            Spacer()
            
            List{
                ForEach(items){ item in
                    HStack(spacing: 25){
                        Text(item.username)
                        Text(item.password)
                    }
                }
                .onDelete{ indexes in
                        for index in indexes {
                            deleteItem(items[index])
                    }
                }
            }
        
        }
        .padding(CGFloat(40))
    }
    
    // Add Item
    func addItem(username:Binding<String>, password:Binding<String>){
        let item = DataItem(username: username.wrappedValue, password:password.wrappedValue)
        context.insert(item)
        
    }
    
    // Delete Item
    func deleteItem(_ item: DataItem) {
        context.delete(item)
    }

}

#Preview {
    LoginView()
}
