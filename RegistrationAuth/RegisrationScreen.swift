//
//  RegisrationScreen.swift
//  Solfy
//
//  Created by Mikhail Kolkov  on 27.10.2020.
//

import SwiftUI

struct RegisrationScreen: View {
    @State var value : String = ""
    @State var phonenum : String = ""
    @State var code : [String] = []
    @State var width = UIScreen.main.bounds.width
    @State var fill : Bool = false
    var body: some View {
        NavigationView{
            VStack{
                VStack(spacing: 24){
                    HStack{
                        Image("logo")
                            .resizable()
                            .frame(width: 40, height: 40)
                    }
                    
                    VStack(spacing: 28){
                        Text("Введите номер телефона")
                            .font(.title3)
                            .font(.system(size: 20))
                            .fontWeight(.semibold)
                        HStack(spacing: 15){
                            
                            Image("phone")
                                .resizable()
                                .frame(width:14, height: 20)
                                .padding()
                            ZStack {
                                Rectangle()
                                    .frame(width: 328, height: 44)
                                    .foregroundColor(.white)
                                HStack(spacing: 2){
                                    ForEach(code,id: \.self){i in
                                     Text(i).fontWeight(.semibold)
                                    }
                                }
                            }
                          
                        }.overlay(RoundedRectangle(cornerRadius: 8).stroke(Color("Color"), lineWidth: 1))
                        .frame(width: 328, height: 44)
                        
                    }
                    Spacer(minLength: 136)
                    VStack(spacing: 12){
                        ZStack {
                            Rectangle()
                                .frame(width: 368, height: 54)
                                .foregroundColor(Color("Color"))
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                                .padding()
                                .opacity((self.code == []) ? 0.35 : 1)
                            NavigationLink(destination: SMSReg()){
                                
                          //  }){
                                Text("Продолжить")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                                    .padding(.vertical)
                                    .frame(width: self.width - 50,alignment: .center)
                                    
                            }.opacity((self.code == []) ? 0.35 : 1)
                            .disabled((self.code == []) ? true : false)
                        }
                        NumberPad(codes: $code, fill: $fill)
                    }
                  
                }
                Spacer()
                
            }
        }
    }
}

struct RegisrationScreen_Previews: PreviewProvider {
    static var previews: some View {
        RegisrationScreen()
    }
}
