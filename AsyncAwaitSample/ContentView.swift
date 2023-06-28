//
//  ContentView.swift
//  AsyncAwaitSample
//
//  Created by Siddharth Kothari on 28/06/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
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
            
            Text("Courtsey: Sean Allen youtube video - https://www.youtube.com/watch?v=ERr0GXqILgc")
            
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
