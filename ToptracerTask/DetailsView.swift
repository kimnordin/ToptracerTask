//
//  GiphyView.swift
//  ToptracerTask
//
//  Created by Kim Nordin on 2022-05-24.
//

import SwiftUI

struct DetailsView: View {
    @Environment(\.presentationMode) var presentation
    @Binding var user: User
    var body: some View {
        VStack(spacing: 8) {
            Text("Hello \(user.username)")
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Text("Logout")
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: .constant(User()))
    }
}
