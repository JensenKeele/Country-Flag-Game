//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Jensen Keele on 1/8/26.
//

import SwiftUI

struct QuestionView: View {
    @Environment(GameManager.self) var gameManager
    var body: some View {
        VStack (spacing:30){
            if gameManager.playingGame {
                HStack {
                    Text("Country Flag Game")
                        .fontWeight(.heavy)
                        .padding()
                    Spacer()
                    Text("\(gameManager.index) out of \(gameManager.questions.count)")
                        .padding()
                }
                ProgressBar(progress: gameManager.progress)
                VStack(spacing: 10) {
                    Text("Which country's flag is this?")
                        .font(.title)
                    Image(gameManager.country)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                    ForEach(gameManager.answerChoices) { answer in
                        AnswerRow(answer: answer)
                    }
                }
                Button {
                    gameManager.goToNextQuestion()
                } label: {
                    CustomButton(text: "Next", background: gameManager.answerSelected ? .yellow : .gray)
                }
                .disabled(!gameManager.answerSelected)
                Spacer()
            }
            else {
                Text("Country Flag Game")
                    .font(.title)
                    .fontWeight(.heavy)
                Text("Congratulations! You've completed the Game!")
                Text("You score \(gameManager.score) out of \(gameManager.questions.count)")
                Button {
                    gameManager.reset()
                } label: {
                    CustomButton(text: "Play Again")
                }
            }
        }
        .foregroundColor(.yellow)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.cyan)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    QuestionView()
}
