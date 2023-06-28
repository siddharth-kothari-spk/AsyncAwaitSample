//
//  ContentView.swift
//  AsyncAwaitSample
//
//  Created by Siddharth Kothari on 28/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
 /*   @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(items) { item in
                    NavigationLink {
                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
                    } label: {
                        Text(item.timestamp!, formatter: itemFormatter)
                    }
                }
                .onDelete(perform: deleteItems)
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
                ToolbarItem {
                    Button(action: addItem) {
                        Label("Add Item", systemImage: "plus")
                    }
                }
            }
            Text("Select an item")
        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }*/
    
    @State private var user: GitUser?
    var body: some View {
        VStack(spacing: 20) {
            
            AsyncImage(url: URL(string: user?.avatarUrl ?? "")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
            } placeholder: {
                Circle()
                    .foregroundColor(.secondary)
                    
            }
            .frame(width: 120, height: 120)
        
            Text(user?.login ?? "Username")
                .bold()
                .font(.title3)
            
            Text(user?.bio ?? "Sample bio")
                .padding()
            
            Spacer()
        }
        .padding()
        .task {
            do {
                user = try await APIService.shared.getUser()
            }
            catch GitUserError.invalidURL {
                print("invalidURL")
            }
            catch GitUserError.invalidResponse {
                print("invalidResponse")
            }
            catch GitUserError.invalidData {
                print("invalidData")
            }
            catch {
                print("unexpected error")
            }
        }
    }
}

/*private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()*/

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
      //  ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        ContentView()
    }
}
