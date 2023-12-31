//
//  NewMessageView.swift
//  ChatApp
//
//  Created by Jerry Kingsbury on 7/2/23.
//

import SwiftUI

struct NewMessageView: View {
    @State private var searchText = ""
    @StateObject var viewModel = NewMessageViewModel()
    
    @Binding var show: Bool
    @Binding var selectedUser: User?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                TextField("To: ", text: $viewModel.searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color.theme.secondaryBackground)
                
//            MARK: - Create Group Message Button
//                Create Group Message Button
//                VStack {
//                    HStack {
//                        NavigationLink {
//                            SelectGroupMembersView(show: $show)
//                                .navigationBarBackButtonHidden()
//                        } label: {
//                            HStack {
//                                ZStack {
//                                    Image(systemName: "circle.fill")
//                                        .resizable()
//                                        .frame(width: 40, height: 40)
//                                        .clipShape(Circle())
//                                        .foregroundColor(Color.theme.secondaryBackground)
//
//
//                                    Image(systemName: "person.3.fill")
//                                        .resizable()
//                                        .frame(width: 25, height: 18)
//                                        .foregroundColor(Color.theme.primaryText)
//                                }
//
//                                Text("Create a new group")
//                                    .fontWeight(.semibold)
//                                    .font(.subheadline)
//                                    .foregroundColor(Color.theme.primaryText)
//                            }
//                        }
//
//                        Spacer()
//                    }
//                    .padding(.leading)
//                    .padding(.top)
//                }
//                MARK: -
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                LazyVStack {
                    ForEach(viewModel.filteredUsers) { user in
                        VStack {
                            HStack {
                                CircularProfileImageView(user: user, size: .small)

                                Text(user.fullname)
                                    .font(.subheadline)
                                    .fontWeight(.semibold)

                                Spacer()
                            }
                            .onTapGesture {
                                selectedUser = user
                                show.toggle()
                            }
                            
                            Divider()
                                .padding(.leading, 40)
                        }
                        .padding(.leading)
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        show.toggle()
                    }
                    .foregroundColor(Color.theme.primaryText)
                }
            }
        }
    }
}

