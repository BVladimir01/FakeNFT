//
//  View+Ext.swift
//  iOS-FakeNFT-Extended
//
//  Created by Герман on 11.10.2025.
//

import SwiftUICore
import UIKit


extension View {
    /// Расширение для приминения стилей на вью
    func applyTextInputStyle() -> some View {
        modifier(TextInputStyle())
    }
    /// Для управления навигацией, чтобы прервать переход назад если данные изменены на экране
    func introspectNavigationController(_ callback: @escaping (UINavigationController) -> Void) -> some View {
        self.background(NavigationControllerIntrospection(callback: callback))
    }
}
