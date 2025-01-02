//
//  Iniciar.swift
//  Evangelho
//
//  Created by Bianca Cordeiro on 23/11/24.
//

import SwiftUI

struct IniciarView: View {
    // Variáveis para armazenar os dados de entrada do usuário
    @State private var usernameOrEmail: String = ""
    @State private var password: String = ""
    @State private var errorMessage: String? = nil

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)

                // Campo para e-mail ou nome de usuário
                TextField("Usuário ou E-mail", text: $usernameOrEmail)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)

                // Campo para senha
                SecureField("Senha", text: $password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(8)

                // Mostrar mensagem de erro, se houver
                if let error = errorMessage {
                    Text(error)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                }

                // Botão para fazer login
                Button(action: performLogin) {
                    Text("Entrar")
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.blue)
                        .cornerRadius(8)
                }

                Spacer()

                // Navegação para a tela de criar conta
                NavigationLink(destination: ContentView()) {
                    Text("Não tem uma conta? Cadastre-se")
                        .foregroundColor(.blue)
                }
            }
            .padding()
            .navigationBarTitle("Login", displayMode: .inline)
        }
    }

    // Função para validar e realizar o login
    private func performLogin() {
        // Validar campos
        guard !usernameOrEmail.isEmpty else {
            errorMessage = "O campo de usuário ou e-mail é obrigatório."
            return
        }
        guard !password.isEmpty else {
            errorMessage = "A senha é obrigatória."
            return
        }

        // Processar login
        errorMessage = nil
        print("Login realizado com sucesso para \(usernameOrEmail)!")
        // Aqui você pode adicionar lógica para autenticação (ex.: comunicação com servidor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
