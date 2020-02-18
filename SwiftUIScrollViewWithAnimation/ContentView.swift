//
//  ContentView.swift
//  SwiftUIScrollViewWithAnimation
//
//  Created by Jakub Slawecki on 18/02/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            TopBar()
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(sectionData) { item in
                        GeometryReader { geometry in
                            CellView(cell: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minX - 30) / -20
                                ), axis: (x: 0, y: 10, z: 0))
                        }
                        .frame(width: 275, height: 275)
                    }
                }
                .padding(30)
                .padding(.bottom, 30)
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct Cell: Identifiable {
    var id = UUID()
    
    var title: String
    var text: String
    var color: Color
}


struct CellView: View {
    var cell: Cell
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(cell.title)
                    .font(.system(size: 24, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color.white)
                Spacer()
            }
            Text(cell.text)
                .frame(maxWidth: .infinity, alignment: .leading)
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(cell.color)
        .cornerRadius(30)
        .shadow(color: cell.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}


struct TopBar: View {
    @State var showVerticalScroll = false
    
    var body: some View {
        HStack {
            Text("Title")
                .font(.system(size: 28, weight: .bold))
            
            Spacer()
            
            Button(action: { self.showVerticalScroll.toggle() }) {
                Image(systemName: "rectangle.grid.1x2.fill")
                    .renderingMode(.original)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 36, height: 36)
                    .background(Color.white)
                    .clipShape(Circle())
                    .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                    .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
            }
            .sheet(isPresented: $showVerticalScroll) {
                VerticalScroll()
            }
        }
        .padding(.horizontal)
        .padding(.leading, 14)
        .padding(.top, 30)
    }
}


//Fake Data
let sectionData = [
    Cell(title: "First Cell", text: "title", color: Color.gray),
    Cell(title: "Second Cell", text: "title", color: Color.gray),
    Cell(title: "Third Cell", text: "title", color: Color.gray),
    Cell(title: "Fourth Cell", text: "title", color: Color.gray),
    Cell(title: "Fifth Cell", text: "title",  color: Color.gray)
]
