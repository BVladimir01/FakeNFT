//
//  ProfileImage.swift
//  iOS-FakeNFT-Extended
//
//  Created by Герман on 11.10.2025.
//

import SwiftUI

struct ProfileImage: View {
    let image: Image
    var canEdit: Bool
    let onTap: () -> Void
    
    init(image: Image, canEdit: Bool = false, onTap: @escaping () -> Void = {}) {
        self.image = image
        self.canEdit = canEdit
        self.onTap = onTap
    }
    
    var body: some View {
        image
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70)
            .clipShape(Circle())
            .overlay {
                Circle()
                    .frame(width: 23)
                    .foregroundColor(.ypLightGrey)
                    .overlay {
                        Image(.camera)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomTrailing)
                    .opacity(canEdit ? 1 : 0)
            }
            .onTapGesture {
                if canEdit {
                    onTap()
                }
            }
    }
}
