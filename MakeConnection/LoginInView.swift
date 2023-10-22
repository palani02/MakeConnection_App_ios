//
//  ContentView.swift
//  MakeConnection
//
//  Created by Palani on 21/10/23.
//

import SwiftUI
import Firebase

class FirebaseManager : NSObject{
    let auth : Auth
    static let shared = FirebaseManager()
    
    override init(){
        FirebaseApp.configure()
        self.auth = Auth.auth()
        super.init()
    }
}
struct LoginInView: View {
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
    @State var showImagePicker = false
    init(){
//        FirebaseApp.configure()
    }
    
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing:15){
                    Picker(selection:$isLoginMode,label:Text("Pick the Entry Mode")){
                        Text("Login")
                            .tag(true)
                        Text("Sign In")
                            .tag(false)
                    }
    //                .font(.system(size: 200))
                    .pickerStyle(.segmented)
                    .padding()
                    if !isLoginMode{
                        Button{
                            showImagePicker.toggle()
                        }label: {
                            Image(systemName: "person.fill")
                                .font(.system(size: 100))
                                .padding()
                        }
                    }
                    Group{
                        TextField("Email", text: $email)
                             .keyboardType(.emailAddress)
                             .textInputAutocapitalization(.none)
                            
                         SecureField("Password",text:$password)
             
                    } .background(.white)
                        .padding(10)
                        .font(.system(size: 25))
                
    //                Text("Here we build a Login Page")
                    
//                    if (isLoginMode==false){
//                        Button{
//                            
//                        }label: {
//                            HStack{
//                                Spacer()
//                                Text("Create Account")
//                                    .foregroundStyle(.white)
//                                    .padding(.vertical,13)
//                                Spacer()
//                            }.background(.blue)
//                                .padding()
//                    }
//                }
//                    if (isLoginMode==true){
                        Button{
                            handleAction()
                        }label: {
                            HStack{
                                Spacer()
                                Text(isLoginMode ? "Log In" : "Create Account")
                                    .foregroundStyle(.white)
                                    .padding(.vertical,13)
                                    .font(.system(size: 20))
                                Spacer()
                            }.background(.blue)
                                .padding()
//                            Text(self.isLoginStatus)
//                                .foregroundColor(.green)
                    }
                    if flag == 1 {
                        Text(self.isLoginStatus)
                         .foregroundColor(.green)
                         .font(.system(size: 20))
                    }else{
                        Text(self.isLoginStatus)
                            .foregroundColor(.red)
                            .font(.system(size: 20))
                    }
//                }
                    
//                .padding()
                }
            }
            .navigationTitle(isLoginMode ? "Log In":"Create Account")
            .background(Color(.init(white: 0, alpha: 0.05)))
            
        }
        .padding()
        .background(Color(.init(white: 0, alpha: 0.05)))
        .fullScreenCover(isPresented: $showImagePicker, onDismiss: nil){
            Text("Choose the Image")
        }
//        .background(.gray)
    }
    private func handleAction(){
        if isLoginMode{
//            print("Successfully Login into the exsisting Credential")
            LoginAccount()
        }else{
//            print("Added New User into the firebase database and store the image")
            CreateNewAccount()
        }
    }
    // this state var is to store the current state scenarios
    @State var isLoginStatus = ""
    @State var flag = 0
    
    // this function is to authenticate the user and check the user is already exsist or new one.
    
    private func LoginAccount(){
        Auth.auth().signIn(withEmail: email, password: password) { result, err in
            if let err = err{
                print("Login Error! Please check Your Password",err)
                self.isLoginStatus = "Login Error! Please check Your Password"
                flag = 0
            }else{
                print("Successfully Login.")
                self.isLoginStatus = "Sucessfully Login into a Account"
                flag = 1
            }
            
        }
    }
    private func CreateNewAccount(){
        Auth.auth().createUser(withEmail: email, password: password) { res, err in
            if let err = err {
                print("Failed To Create New Account",err)
                self.isLoginStatus = "Failed to Create a User. Because the users Mail is Already Available!!. Try to Login"
                self.flag = 0
            }else{
                print("Successfully Created New User Account")
                self.isLoginStatus = "Account Was Successfully Created."
                self.flag = 1
                
            }
        }
    }
}

#Preview {
    LoginInView()
}
