//
//  NewMessageView.swift
//  ChatApp
//
//  Created by Jerry Kingsbury on 7/2/23.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel = NewMessageViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    HStack {
                        NavigationLink {
                            SelectGroupMembersView()
                                .navigationBarBackButtonHidden()
                        } label: {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .clipShape(Circle())
                                    .foregroundColor(Color(.systemGray6))
                                
                                Image(systemName: "person.3.fill")
                                    .resizable()
                                    .frame(width: 25, height: 18)
                                    .foregroundColor(Color(.black))
                            }
                            
                            Text("Create a new group")
                                .fontWeight(.semibold)
                                .font(.subheadline)
                        }
                        
                        Spacer()
                    }
                    .foregroundColor(.black)
                    .padding(.leading)
                }
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(viewModel.users) { user in
                    
                    VStack {
                        NavigationLink(value: user) {
                            HStack {
                                CircularProfileImageView(user: user, size: .small)
                                
                                Text(user.username)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)
                                
                                Spacer()
                            }
                            .foregroundColor(.black)
                            .padding(.leading)
                        }
                        
                        
                        Divider()
                            .padding(.leading, 40)
                    }
                }
                .searchable(text: $searchText, prompt: "To: ")
            }
            .navigationDestination(for: User.self, destination: { user in
                ChatView(user: user)
            })
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            NewMessageView()
        }
    }
}
