//
//  ContentView.swift
//  KenshinKadai3
//
//  Created by Kenshin on 2024/02/25.
//

import SwiftUI

struct ContentView: View {
    @State var inputs: [String] = .init(repeating: "", count: 2)
    @State var outputs: [String] = .init(repeating: "", count: 2)
    @State var inversL = false
    @State var inversR = false
    @State var ans = "値が入っていません"
    var body: some View {
        VStack {
            HStack {
                CostomField(num: $inputs[0])
                CostomField(num: $inputs[1])
            }

            HStack {
                Spacer()
                Text("+")
                // トグルスイッチ
                Toggle(isOn: $inversL) {
                    Text("test")
                }
                .labelsHidden()
                Text("-")

                Spacer()

                Text("+")
                // トグルスイッチ
                Toggle(isOn: $inversR) {
                    Text("test")
                }
                .labelsHidden()
                Text("-")
                Spacer()
            }

            // ボタン
            Button("Button") {
                guard let leftnum = Int(inputs[0]), let rightnum = Int(inputs[1]) else {
                    ans = "値が入っていません"
                    return
                }

                let signL: Int
                if inversL {
                    signL = -1
                } else {
                    signL = 1
                }

                let signR: Int
                if inversR {
                    signR = -1
                } else {
                    signR = 1
                }

                ans = "\(leftnum * signL + rightnum * signR)"
                outputs[0] = "\(leftnum * signL)"
                outputs[1] = "\(rightnum * signR)"

            }

            // テキスト
            HStack {
                Spacer()
                Text(outputs[0])
                    .frame(height: 50)
                Spacer()
                Text("+")
                    .frame(height: 50)
                Spacer()
                Text(outputs[1])
                    .frame(height: 50)
                Spacer()
            }

            // 答え
            Text(ans)
                .padding()

        }
    }
}

struct CostomField: View {
    @Binding var num: String
    var body: some View {
        TextField("", text: $num)
            .keyboardType(.numberPad)
            .border(Color.gray, width: 1)
            .padding()
    }
}

#Preview {
    ContentView()
}
