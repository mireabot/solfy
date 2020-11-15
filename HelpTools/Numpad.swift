//
//  Numpad.swift
//  Solfy
//
//  Created by Mikhail Kolkov  on 27.10.2020.
//

import Foundation
import SwiftUI

struct NumberPad : View {
    
    @Binding var codes : [String]
    @Binding var fill : Bool
    
    var body : some View{
        
        VStack(alignment: .leading,spacing: 20){
            
            ForEach(datas){i in
                
                HStack(spacing: self.getspacing()){
                    
                    ForEach(i.row){j in
                        
                        Button(action: {
                            
                            if j.value == "delete.left.fill"{
                             
                                self.codes.removeLast()
                            }
                            else{
                                
                                self.codes.append(j.value)
                                
                                if self.codes.count == 12{
                                    
                                    self.fill = true
                                }
                            }
                            
                        }) {
                            
                            if j.value == "delete.left.fill"{
                                
                                Image(systemName: j.value).font(.body).padding(.vertical)
                            }
                            else{
                                
                                Text(j.value).font(.title).fontWeight(.semibold).padding(.vertical)
                            }
                            
                            
                        }
                    }
                }
                
            }
            
        }.foregroundColor(Color("nums"))
    }
    
    func getspacing()->CGFloat{
        
        return UIScreen.main.bounds.width / 3
    }
    
    func getCode()->String{
        
        var code = ""
        
        for i in self.codes{
        
            code += i
            
        }
        
        return code.replacingOccurrences(of: " ", with: "")
    }
}


// datas...

struct type : Identifiable {
    
    var id : Int
    var row : [row]
}

struct row : Identifiable {
    
    var id : Int
    var value : String
}

var datas = [

type(id: 0, row: [row(id: 0, value: " 1"),row(id: 1, value: "2"),row(id: 2, value: "3")]),
type(id: 1, row: [row(id: 0, value: "4"),row(id: 1, value: "5"),row(id: 2, value: "6")]),
type(id: 2, row: [row(id: 0, value: "7"),row(id: 1, value: "8"),row(id: 2, value: "9")]),
type(id: 3, row: [row(id: 0, value: "   "),row(id: 1, value: "0"),row(id: 2, value: "delete.left.fill")])
]


struct Numpad_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
