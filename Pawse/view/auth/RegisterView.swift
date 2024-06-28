//
//  Register.swift
//  Pawse
//
//  Created by hendra on 25/06/24.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct RegisterView: View {
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var navigateToLoginView: Bool = false
    @AppStorage("uid") var userID: String = ""

    var body: some View {
        VStack(spacing: 20) {
            Image("auth")
                .resizable()
                .frame(width: 215, height: 250)
            HStack {
                Text("Sign Up")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                Spacer()
            }
            
            TextField("Name", text: $name)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
            
            TextField("Email", text: $email)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .textContentType(.emailAddress)
            
            SecureField("Password", text: $password)
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .textContentType(.newPassword)
            
            Button {
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    if let result = result {
                        userID = result.user.uid
                        let changeRequest = result.user.createProfileChangeRequest()
                        changeRequest.displayName = name
                        changeRequest.commitChanges { error in
                            if let error = error {
                                print(error.localizedDescription)
                                return
                            }
                            let db = Firestore.firestore()
                            db.collection("users").document(userID).setData([
                                "name": name,
                                "email": email,
                                "uid": userID,
                                "coin": 0
                            ]) { error in
                                if let error = error {
                                    print(error.localizedDescription)
                                } else {
                                    print("User added to Firestore.")
                                }
                            }
                        }
                    }
                }
            } label: {
                Text("Sign Up")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.biruBTN)
                    .cornerRadius(10)
            }
            NavigationLink {
                LoginView()
            } label: {
                Text("Sign In here")
            }
        }
        .padding()
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterView()
}
