//
//  LoginPage.swift
//  MakeConnection
//
//  Created by Palani on 22/10/23.
//

import SwiftUI

struct LoginPage: View {
    @State var isLogin = true
    @State var email = ""
    @State var password = ""
    
    var body: some View {
        NavigationView{
            ScrollView(){
                VStack(spacing:15){
                    Spacer()
                    Spacer()
                    Picker(selection:$isLogin,label: Text("Choose one Mode is Enter")){
                        Text("Log In")
                            .tag(true)
//                            .font(.system(size: 40))
                        Text("Sign In")
                            .tag(false)
                    }
                    .pickerStyle(.segmented)
                    
                
                    if isLogin
                    {
                        Button{
                        }
                        label: {
                            Spacer()
                            Image(systemName: "person.fill")
                                .font(.system(size: 120))
                            Spacer()
                        }
                    }
                   
                    Group{
                        TextField("Email",text: $email)
                            .keyboardType(.emailAddress)
                        SecureField("Password", text: $password)
                        Spacer()
                            
                    }
                    .font(.system(size: 25))
                    .padding(.vertical,10)
                    
                    Group{
                        Button{
                            handleAction()
                        }label: {
                            HStack{
//                                Spacer()
                                Text(isLogin ? "Log In" : "Sign In")
                                    .font(.system(size: 20))
                                    .foregroundStyle(.white)
                                    .padding(.horizontal,150)
                                    .padding(.vertical,15)
                                    .background(.blue)
                                    
                            }
//                            .background(.blue)
//                            .padding()
                           
                        }
                        
                    }
                    
//                    .foregroundColor(.white)
//                    .background(.white)
                }
                .font(.system(size:20))
            }
        
            .navigationTitle(isLogin ? "Exsisting User" : "Create Account")
        }
        .padding()
        
    }
    
    private func handleAction(){
        if isLogin{
            print("Login Into exsisting Account Successfully")
        }
        else{
            print("Created New User Account Successfully!!!")
        }
    }
}

#Preview {
    LoginPage()
}
