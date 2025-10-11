//
//  View+Ext.swift
//  iOS-FakeNFT-Extended
//
//  Created by Герман on 11.10.2025.
//

import SwiftUICore

/// Расширение для приминения стилей на вью
extension View {
    func applyTextInputStyle() -> some View {
        modifier(TextInputStyle())
    }
}
