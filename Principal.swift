import SwiftUI

struct MainView: View {
    // Variáveis para armazenar o evangelho e as reflexões
    @State private var gospelOfTheDay: String = """
    Evangelho (João 3,16-18)
    Deus amou tanto o mundo que deu o seu Filho único, para que todo aquele que nele crer não pereça, mas tenha a vida eterna.
    """
    @State private var reflections: [String] = [
        "Confie no amor incondicional de Deus.",
        "Viva com gratidão pela salvação recebida.",
        "Compartilhe a mensagem de esperança com o próximo."
    ]

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Título principal
                    Text("Evangelho do Dia")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)

                    // Texto do Evangelho
                    Text(gospelOfTheDay)
                        .font(.body)
                        .multilineTextAlignment(.leading)
                        .padding()
                        .background(Color.gray.opacity(0.1))
                        .cornerRadius(8)

                    // Título para reflexões
                    Text("Reflexões")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.top)

                    // Lista de reflexões
                    ForEach(reflections, id: \.self) { reflection in
                        Text("• \(reflection)")
                            .font(.body)
                            .multilineTextAlignment(.leading)
                            .padding(.vertical, 2)
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitle("Evangelho do Dia", displayMode: .inline)
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
