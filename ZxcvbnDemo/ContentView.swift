//
//  ContentView.swift
//  ZxcvbnDemo
//
//  Created by Julien on 23/11/2022.
//

import SwiftUI
import ZxcvbnCWrapper
import ZxcvbnJS

let zxcvbnC = ZxcvbnCWrapper.shared
let zxcvbnJS = ZxcvbnJS()

struct ContentView: View {
    
    @State var password = "Tr0ub4dour&3"
    
    var body: some View {
        NavigationView {
            Form {
                Section("Input") {
                    TextField("password", text: $password)
                        .textInputAutocapitalization(.never)
                        .disableAutocorrection(true)
                }
                
                Section("ZxcvbnC") {
                    LabeledContent("entropy", value: "\(resultC.entropy)")
                }
                
                Section("ZxcvbnJS") {
                    LabeledContent("score", value: "\(resultJS.score)")
                    LabeledContent("warning", value: "\(resultJS.warning)")
                    LabeledContent("suggestions", value: "\(resultJS.suggestions)")
                }
            }
            .navigationTitle("Zxcvbn Demo")
        }
    }
    
    var resultC: ZxcvbnCWrapper.Result {
        return zxcvbnC.evaluate(password: password)
    }

    var resultJS: ZxcvbnJS.Result {
        return zxcvbnJS.evaluate(password: password)
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
