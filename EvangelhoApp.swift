//
//  EvangelhoApp.swift
//  Evangelho
//
//  Created by Bianca Cordeiro on 23/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var selectedTab: Tab = .login // Controle para alternar entre abas
    
    enum Tab {
        case login
        case createAccount
    }
    
    var body: some View {
        VStack {
            // Picker para alternar entre Login e Criar Conta
            Picker("Selecione", selection: $selectedTab) {
                Text("Login").tag(Tab.login)
                Text("Criar Conta").tag(Tab.createAccount)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            
            // Exibição condicional do conteúdo baseado na aba selecionada
            if selectedTab == .login {
                LoginView()
            } else {
                CreateAccountView()
            }
        }
    }
}

// Tela de Login
struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Fazer Login")
                .font(.largeTitle)
                .bold()
            
            TextField("Usuário", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Senha", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: login) {
                Text("Entrar")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top, 40)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Atenção"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func login() {
        guard !username.isEmpty && !password.isEmpty else {
            alertMessage = "Por favor, preencha todos os campos."
            showAlert = true
            return
        }
        
        if username == "usuario" && password == "senha" {
            alertMessage = "Login bem-sucedido!"
        } else {
            alertMessage = "Usuário ou senha incorretos."
        }
        showAlert = true
    }
}

// Tela de Criar Conta
struct CreateAccountView: View {
    @State private var fullName: String = ""
    @State private var email: String = ""
    @State private var dateOfBirth: Date = Date()
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var showAlert: Bool = false
    @State private var alertMessage: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Criar Conta")
                .font(.largeTitle)
                .bold()
            
            TextField("Nome Completo", text: $fullName)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            TextField("E-mail", text: $email)
                .keyboardType(.emailAddress)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            DatePicker("Data de Nascimento", selection: $dateOfBirth, displayedComponents: .date)
                .datePickerStyle(CompactDatePickerStyle())
                .padding(.horizontal)
            
            SecureField("Senha", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            SecureField("Confirmar Senha", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)
            
            Button(action: createAccount) {
                Text("Criar Conta")
                    .bold()
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding(.top, 40)
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Atenção"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func createAccount() {
        guard !fullName.isEmpty else {
            alertMessage = "Por favor, preencha o Nome Completo."
            showAlert = true
            return
        }
        
        guard !email.isEmpty, email.contains("@"), email.contains(".") else {
            alertMessage = "Por favor, insira um e-mail válido."
            showAlert = true
            return
        }
        
        guard password.count >= 6 else {
            alertMessage = "A senha deve conter pelo menos 6 caracteres."
            showAlert = true
            return
        }
        
        guard password == confirmPassword else {
            alertMessage = "A senha e a confirmação de senha não correspondem."
            showAlert = true
            return
        }
        
        alertMessage = "Conta criada com sucesso!"
        showAlert = true
    }
}


