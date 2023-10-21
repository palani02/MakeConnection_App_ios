//
//  ContentView.swift
//  MakeConnection
//
//  Created by Palani on 21/10/23.
//

import SwiftUI

struct LoginInView: View {
    @State var isLoginMode = false
    @State var email = ""
    @State var password = ""
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
//        .background(.gray)
    }
    private func handleAction(){
        if isLoginMode{
            print("Successfully Login into the exsisting Credential")
        }else{
            print("Add New User into the firebase database and store the image")
        }
    }
}

#Preview {
    LoginInView()
}
