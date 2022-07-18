//
//  NoteView.swift
//  weatherapp (iOS)
//
//  Created by Guerin Steven Colocho Chacon on 2/06/22.
//

import SwiftUI
import Combine



enum Field{
    case inFocus
    case outFocus
}


struct NoteView: View{
    
    @State var  bgColor:Color = Color.red;
    @State var  colors:[Color]=[.brown,.indigo,.mint,.pink,.orange,.teal]
    @State var currentIndex:Int? = 0
    @State var borderColor: Color = Color.blue
    
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableView.appearance().tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: Double.leastNonzeroMagnitude))
        
        
    }
    
    var body: some View{
        
        GeometryReader{
            geo in
            let width = geo.size.width
            let height = geo.size.height
            
            VStack{
                Text("selectColorExpense")
                    .font(.title3).fontWeight(.medium)
                    .frame(maxWidth:.infinity, alignment: .leading)
                
                ScrollView(.horizontal,showsIndicators:  false){
                    HStack{
                        ForEach(Array(colors.enumerated()), id: \.offset) { index, colorSelected in
                            Circle()
                                .strokeBorder(currentIndex == index && currentIndex != nil ? borderColor: Color.white,lineWidth: 4)
                                .background(Circle().foregroundColor(colorSelected))
                                .frame(width:width*0.14, height: height*0.07, alignment: .center)
                                .onTapGesture {
                                    currentIndex = index;
                                    
                                }
                        }
                        ColorPicker("", selection: $bgColor, supportsOpacity: false)
                            .frame(width: width*0.13, height: height*0.065)
                            .background(bgColor).clipShape(RoundedRectangle(cornerRadius: 50)).onTapGesture {
                                currentIndex = nil
                            }
                    }
                    
                }.listRowInsets(EdgeInsets())
                    .contentShape(Rectangle())
                    .padding(.vertical, height * 0.04)

                
                FormExpense(width: width, height: height)
                
            }
            
            
        }
        .padding(.horizontal, 10)
        .padding(.vertical, 40)

    }
}


class NumbersOnly: ObservableObject {
    @Published var value = "" {
        didSet {
            let filtered = value.filter { $0.isNumber }
            
            if value != filtered {
                value = filtered
                print(filtered)
            }
        }
    }
}


class TextInput:ObservableObject{
    @Published var value = ""
}

struct FormExpense:View{
    
    
    private var width: CGFloat
    private var height: CGFloat
    @ObservedObject var amoutToDebitController:NumbersOnly = NumbersOnly()
    @ObservedObject var expenseDetailInput: TextInput = TextInput()
    @FocusState private var amountFieldIsFocused:Field?
    @FocusState private var expenseFocus:Field?
    

    init(width: CGFloat, height:CGFloat){
        self.height = height
        self.width = width
    }
    
    
    var body: some View{
        VStack{
            Text("expenseName")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading).padding(.top,height * 0.04)
            TextField("expenseHint", text: $expenseDetailInput.value)
                .focused($expenseFocus, equals: .inFocus)
                .onReceive(Just(expenseFocus)) { newValue in
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            Divider().background(expenseFocus == .inFocus ? .blue : .white).padding(.bottom,height * 0.03)

            Text("amountToDebit")
                .font(.title3)
                .frame(maxWidth: .infinity, alignment: .leading)
            TextField("enterAmountToDebit", text: $amoutToDebitController.value)
                .focused($amountFieldIsFocused, equals: .inFocus)
                .keyboardType(.numberPad)
                .onReceive(Just(amountFieldIsFocused)) { newValue in
                }
                .frame(maxWidth: .infinity, alignment: .leading)
        
            Divider().background(amountFieldIsFocused == .inFocus ? .blue : .white).padding(.bottom,height * 0.03)

            Button(
                action: {
                    print("send data \(amoutToDebitController.value)")
                },
                label: {
                    HStack(alignment:.center, spacing:width * 0.0){
                        Spacer()
                        Text("Apply")
                            .font(.headline)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .tint(.white)
                            .padding(.trailing,width * 0.3)
                        
                        
                        Image(systemName: "paperplane.fill").resizable().aspectRatio(contentMode: .fill)
                            .frame(width: 20, height: 20, alignment: .center)
                            .tint(.white)
                            .padding(.trailing,width * 0.1)
                    }
                })
            .frame( width: width, height:  45,alignment: .center)         .background(.black)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .padding(.vertical, height * 0.04)
            
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) {
                amountFieldIsFocused = nil
            }
            
        }
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        NoteView()
    }
}
