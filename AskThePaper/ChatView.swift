//
//  ChatView.swift
//  AskThePaper
//
//  Created by Bidisha Biswas on 12/5/25.
//

import FoundationModels
import SwiftUI

struct ChatView: View {
    @State private var session = LanguageModelSession()
    
    var body: some View {
        VStack {
            Button("Tell me a joke") {
                Task {
                    await respond(to: "Tell me a joke")
                }
            }
            Button("Route Planning") {
                Task {
                    await respond(to: "What's the best driving route from Denver to Breckrenridge?")
                }
            }
        }
    }
    
    func respond(to prompt: String) async {
        do {
            let response = try await session.respond(to: prompt)
            print(response.content)
        } catch(let error) {
            print(error.localizedDescription)
        }
    }
}
