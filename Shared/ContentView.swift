//
//  ContentView.swift
//  Shared
//
//  Created by Guerin Steven Colocho Chacon on 29/05/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @Environment(\.colorScheme) var colorScheme
    
    @State var showBottomSheet:Bool = false
    @ObservedObject var locationHandler:LocationDeviceInvoke = LocationDeviceInvoke()
    
    var body: some View {
        
        NavigationView {
            WeatherLayout(statusDay: colorScheme == .dark ? StatusDay.night :StatusDay.day ).toolbar(content: {
                HStack{
                    Button(action: {
                        showBottomSheet.toggle()
                    }, label: {
                        Image(systemName: "plus").foregroundColor(colorScheme == .dark ? .white : .black)
                    })
                }.frame(maxWidth: .infinity)
                    .padding(.horizontal,10)
            })
            .navigationTitle(Text("titleApp"))
        }
        .sheet(isPresented: $showBottomSheet, content: {
            NoteView().background(colorScheme == .dark ?       Color("backgroundColor").opacity(0.6) :  Color.white)
        })
        .onAppear{
            container.resolve(LocationDevice.self)?.authorizedWhenInUse()
          
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
                .environment(\.locale, .init(identifier: "en"))
            
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext) .environment(\.locale, .init(identifier: "es"))
        }
    }
    
}
