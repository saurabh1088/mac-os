//
//  MainSidebarMenuItemView.swift
//  MacOSLearnings
//
//  Created by Saurabh Verma on 19/09/25.
//

import SwiftUI

struct MainSidebarMenuItemView: View {
    let title: String
    let systemImageName: String?
    let customImageName: String?
    
    var body: some View {
        HStack {
            if let systemImageName {
                Image(systemName: systemImageName)
            }
            if let customImageName {
                Image(customImageName)
            }
            Text(title)
        }
    }
}

#Preview {
    MainSidebarMenuItemView(title: "Title",
                            systemImageName: nil,
                            customImageName: nil)
}
