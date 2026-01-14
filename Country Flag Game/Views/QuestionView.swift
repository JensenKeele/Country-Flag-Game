//
//  QuestionView.swift
//  Country Flag Game
//
//  Created by Jensen Keele on 1/8/26.
//

import SwiftUI

struct QuestionView: View {
    var body: some View {
        VStack (spacing:30){
            HStack {
                Text("Country Flag Game")
                    .fontWeight(.heavy)
                    .padding()
                Spacer()
                Text("1 out of 3")
                    .padding()
            }
            ProgressBar(progress: 67)
            VStack(spacing: 10) {
                Text("Which country's flag is this?")
                    .font(.title)
                Image("Italy")
                AnswerRow(answer: Answer(text: "Italy", isCorrect: true))
                AnswerRow(answer: Answer(text: "England", isCorrect: false))
                AnswerRow(answer: Answer(text: "Germany", isCorrect: false))
                AnswerRow(answer: Answer(text: "France", isCorrect: false))
            }
            CustomButton(text: "Next")
            Spacer()
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
