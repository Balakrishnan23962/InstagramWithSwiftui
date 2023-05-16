//
//  IGTextFieldModifier.swift
//  InstagramWithSwiftui
//
//  Created by Gasc_Internship1 on 16/05/23.
//

import Foundation
import SwiftUI

struct IGTextFieldModifier : ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray5))
            .cornerRadius(10)
            .padding(.horizontal,24)
            .padding(.top,4)
    }
}
