//
//  ExploreVIewModel.swift
//  TwitterClone
//
//  Created by Yogesh Lamba on 12/01/23.
//

import Foundation

//class ExploreViewModel:ObservableObject{
//    @Published var users=[User]()
//    @Published var searchedText:String=""
//    
//    var searchableUser:[User]{
//        if searchedText.isEmpty{
//            return users
//        }
//        else{
//            let lowerCaseQuery=searchedText.lowercased()
//            
//            return users.filter {
//                $0.username.contains(lowerCaseQuery) ||
//                $0.fullname.lowercased().contains(lowerCaseQuery)
//            }
//        }
//    }
//    
//    
//    var service=UserService()
//    
//    func fetchUsers(){
//        service.fetchUsersInfo { users in
//            self.users=users
//        }
//    }
//}
