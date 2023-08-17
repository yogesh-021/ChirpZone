//
//  AuthViewModel.swift
//  ChirpZone
//
//  Created by Yogesh Lamba on 11/08/23.
//

import SwiftUI
import Firebase


class AuthViewModel:ObservableObject{
    @Published var userSession:Firebase.User?//Where we store userInfo,If user is loggedin then it has value otherwise nil.
    @Published var didAuthenticateUser=false
    @Published var currentUser:User?//To get access to current user through fetchUser function
    
    var tempUserSession:Firebase.User? //As we can't set actual userSession in this as it will force it to mainView
    private let service=UserService()
    init() {
        self.userSession=Auth.auth().currentUser//If user is loggedin then it will store it's info in userSession
        self.fetchUser()
    }
    
    func login(withEmail email:String,password:String)
    {
        Auth.auth().signIn(withEmail: email, password: password){result,error in
            if let error=error{
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            guard let user=result?.user else{return}
            self.userSession=user
            self.fetchUser()
        }
    }
    func register(withEmail email:String,password:String,username:String,Fullname:String){
        Auth.auth().createUser(withEmail: email, password: password)
        {result,error in
            if let error=error{
                print("DEBUG: Failed to register user \(error.localizedDescription)")
                return
            }
            guard let user=result?.user else{return}
                self.tempUserSession=user
             //self.userSession=user
            //(We can't set it now as it will force Content View to show maininterfaceView before profilePhotoView)
            
            
            print("DEBUG:User registred successfully")
            print("DEBUG:User is \(self.userSession)")
            
            let data=["email":email,
                      "username":username.lowercased(),
                      "fullname":Fullname,
                      "uid":user.uid]
            
            Firestore.firestore().collection("users")
                .document(user.uid)
                .setData(data){_ in
                    self.didAuthenticateUser=true//To tell that user is authenticated
                    print("Did upload user data")
                }
        }
    }
    
    func signOut(){
        userSession=nil//to set userSession to nil so as to logout in frontend
        
        try?Auth.auth().signOut()//To logout in backend in database
    }
    
    
    func uploadProfileImage(_ image:UIImage){
        guard let uid=tempUserSession?.uid else{return}
        ImageUploader.uploadImage(image: image) { profileImageUrl in
            Firestore.firestore().collection("users")     //under users section
                .document(uid)
                .updateData(["profileImageUrl":profileImageUrl]){_ in
                    self.userSession=self.tempUserSession //Now we can set it to userSession as now we want to go to mainView
                    self.fetchUser()//To fetch info after signing up
                }
        }

    }
    
    func fetchUser(){
        print("Fetching user info")
        guard let uid=userSession?.uid else{return}
        service.fetchUser(withUid: uid){ user in
            print("Fetching user info required")
            self.currentUser=user
        }
        
    }
}
