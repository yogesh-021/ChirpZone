//
//  SideMenuViewModel.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 10/08/23.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logout
    
    var title: String {
        switch self {
            case .profile: return "Profile"
            case .lists: return "Lists"
            case .bookmarks: return "Bookmarks"
            case .logout: return "Logout"
        }
    }
    
    var imageName: String {
        switch self {
            case .profile: return "person"
            case .lists: return "list.bullet"
            case .bookmarks: return "bookmark"
            case .logout: return "arrow.left.square"
        }
    }
}
