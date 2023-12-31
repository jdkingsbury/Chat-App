//
//  GroupChatCell.swift
//  ChatApp
//
//  Created by Jerry Kingsbury on 7/23/23.
//

import SwiftUI

struct GroupChatCell: View {
    let isFromCurrentUser: Bool
    let messageText: String
    
    var body: some View {
        HStack {
            if isFromCurrentUser {
                Spacer()
                
                Text(messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            } else {
                HStack(alignment: .bottom, spacing: 8) {
                    CircularProfileImageView(user: User.MOCK_USERS[0], size: .xxSmall)
                    
                    Text(messageText)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray5))
                        .foregroundColor(.black)
                        .clipShape(ChatBubble(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    
                    Spacer()
                }
            }
        }
        .padding(.horizontal, 8)
    }
}

struct GroupChatCell_Previews: PreviewProvider {
    static var previews: some View {
        GroupChatCell(isFromCurrentUser: true, messageText: "Test")
    }
}
