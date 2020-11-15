//
//  SMSScreen.swift
//  Solfy
//
//  Created by Mikhail Kolkov  on 02.11.2020.
//

import Foundation
import SwiftUI

let screenSize = UIScreen.main.bounds

struct SMSReg : View {
    @State var timeRemaining = 20
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State private var isPin1FirstResponder: Bool? = true
    @State private var isPin2FirstResponder: Bool? = false
    @State private var isPin3FirstResponder: Bool? = false
    @State private var isPin4FirstResponder: Bool? = false
    @State var code : [String] = []
    @State var width = UIScreen.main.bounds.width
    @State var fill : Bool = false
    @State private var token1 = ""
    @State private var token2 = ""
    @State private var token3 = ""
    @State private var token4 = ""
    
    var body: some View {
        NavigationView{
            VStack {
                VStack(spacing: 44){
                    HStack{
                        Button(action: {
                            
                        }) {
                            Image("return")
                                .resizable()
                                .frame(width: 24, height: 24)
                        }
                        Spacer()
                    }.padding()
                    HStack(alignment: .center){
                        Text("Введите SMS-код")
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                    }
                }
                VStack(spacing: 40){
                    VStack(spacing: 40){
                        VStack(spacing: 80){
                            HStack(spacing: 12) {
                                Group {
                                    CustomTextField(text: self.$token1,
                                                    nextResponder: self.$isPin2FirstResponder,
                                                    isResponder: self.$isPin1FirstResponder, previousResponder: .constant(nil))
                                    
                                    CustomTextField(text: self.$token2,
                                                    nextResponder: self.$isPin3FirstResponder,
                                                    isResponder: self.$isPin2FirstResponder, previousResponder: self.$isPin1FirstResponder)
                                    
                                    CustomTextField(text: self.$token3,
                                                    nextResponder: self.$isPin4FirstResponder,
                                                    isResponder: self.$isPin3FirstResponder, previousResponder: self.$isPin2FirstResponder)
                                    
                                    CustomTextField(text: self.$token4,
                                                    nextResponder: .constant(nil),
                                                    isResponder: self.$isPin4FirstResponder, previousResponder: self.$isPin3FirstResponder)
                                    
                                    
                                    
                                }
                                .frame(width: 38, height: 44)
                                .padding(.all, 5)
                                .background(RoundedRectangle(cornerRadius: 8).stroke(Color("Color"), lineWidth: 1))
                                .font(Font.system(size: 20, design: .default))
                                .multilineTextAlignment(.center)
                            }.padding(.top, 25)
                            VStack(spacing: 3){
                                Text("Мы отправили SMS-код на номер")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                                Text("+998 84 849-94-48")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 14))
                            }
                        }
                        HStack(spacing: 4){
                            Text("Получить новый SMS-код через")
                                .foregroundColor(.gray)
                            Text("\(timeRemaining)")
                                .foregroundColor(.gray)
                                        .onReceive(timer) { _ in
                                            if self.timeRemaining > 0 {
                                                self.timeRemaining -= 1
                                            }
                                        }
                            Text("c")
                                .foregroundColor(.gray)
                        }
                    }
                    NumberPad(codes: $code, fill: $fill).padding()
                    Spacer()
                }
                
            }
            
        }.navigationBarHidden(true)
    }
}

struct SMSScreen_Previews: PreviewProvider {
    static var previews: some View {
        SMSReg()
    }
}
