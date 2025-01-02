//
//  Tela Principal.swift
//  Evangelho
//
//  Created by Bianca Cordeiro on 27/12/24.
//

import SwiftUI

struct ontentView: View {
    var body: some View {
        NavigationView {
            Sidebar()
            HomeView()
        }
    }
}

struct Sidebar: View {
    var body: some View {
        List {
            NavigationLink(destination: HomeView()) {
                Label("Evangelho do Dia", systemImage: "house.fill")
            }
            NavigationLink(destination: MeuPerfilView()) {
                Label("Reflexao", systemImage: "person.circle")
            }
            NavigationLink(destination: MinhasConexoesView()) {
                Label("Perguntas", systemImage: "person.2")
            }
            NavigationLink(destination: MensagensView()) {
                Label("Mensagens", systemImage: "bubble.left.and.bubble.right")
            }
            NavigationLink(destination: ConfiguracoesView()) {
                Label("Configurações", systemImage: "gear")
            }
            NavigationLink(destination: AjudaView()) {
                Label("Ajuda", systemImage: "questionmark.circle")
            }
            NavigationLink(destination: SairView()) {
                Label("Sair", systemImage: "arrow.backward")
            }
        }
        .listStyle(SidebarListStyle())
        .navigationTitle("Evangelho")
    }
}

struct omeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Bem-vindo(a), [Usuário]!")
                .font(.title)
                .padding(.bottom, 5)
            Text("O poder de mudar o dia a dia das pessoas!")
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.bottom, 20)

            VStack(spacing: 20) {
                NavigationLink(destination: MeuPerfilView()) {
                    MenuButton(title: "Evangelho", description: "Gerencie suas informações pessoais.", icon: "person.circle")
                }
                NavigationLink(destination: MinhasConexoesView()) {
                    MenuButton(title: "Reflexao", description: "Explore e organize suas conexões.", icon: "person.2")
                }
                NavigationLink(destination: MensagensView()) {
                    MenuButton(title: "Mensagens", description: "Converse com amigos e contatos.", icon: "bubble.left.and.bubble.right")
                }
                NavigationLink(destination: EventosView()) {
                    MenuButton(title: "Eventos", description: "Participe de atividades e encontros.", icon: "calendar")
                }
            }
            Spacer()
        }
        .padding()
    }
}

struct MenuButton: View {
    let title: String
    let description: String
    let icon: String

    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 40, height: 40)
                .foregroundColor(.blue)

            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                Text(description)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(8)
        .shadow(color: Color.black.opacity(0.1), radius: 4, x: 0, y: 2)
    }
}

struct MeuPerfilView: View {
    var body: some View {
        Text("Meu Perfil")
            .font(.largeTitle)
    }
}

struct MinhasConexoesView: View {
    var body: some View {
        Text("Minhas Conexões")
            .font(.largeTitle)
    }
}

struct MensagensView: View {
    var body: some View {
        Text("Mensagens")
            .font(.largeTitle)
    }
}

struct EventosView: View {
    var body: some View {
        Text("Eventos")
            .font(.largeTitle)
    }
}

struct ConfiguracoesView: View {
    var body: some View {
        Text("Configurações")
            .font(.largeTitle)
    }
}

struct AjudaView: View {
    var body: some View {
        Text("Ajuda")
            .font(.largeTitle)
    }
}

struct SairView: View {
    var body: some View {
        Text("Sair")
            .font(.largeTitle)
    }
}

@main
struct EvangelhoApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
