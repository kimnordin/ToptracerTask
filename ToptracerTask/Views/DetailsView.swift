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
    @State var uiImage: UIImage?
    
    let service = Service()
    
    var body: some View {
        VStack(spacing: 8) {
            if let image = uiImage {
                Image(uiImage: image)
            }
            Text("Hello \(user.username)")
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Text("Logout")
            }
        }
        .onAppear {
            service.fetchGif { result in
                switch result {
                case .success(let giphy):
                    uiImage = giphy
                case .failure(let error):
                    print("Failure fetching gif: ", error)
                }
            }
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: .constant(User()))
    }
}
