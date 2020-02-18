//
//  VerticalScroll.swift
//  SwiftUIScrollViewWithAnimation
//
//  Created by Jakub Slawecki on 18/02/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import SwiftUI

struct VerticalScroll: View {
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 60) {
                    ForEach(sectionData2) { item in
                        GeometryReader { geometry in
                            VerticalCellView(cell: item)
                                .rotation3DEffect(Angle(degrees:
                                    Double(geometry.frame(in: .global).minY) / -90
                                ), axis: (x: 10, y: 0, z: 0))
                        }
                        .frame(width: cellWidth, height: cellHeight)
                    }
                }
                .padding(30)
            }
        }
    }
}

struct VerticalScroll_Previews: PreviewProvider {
    static var previews: some View {
        VerticalScroll()
    }
}

struct VerticalCellView: View {
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
        .frame(width: cellWidth, height: cellHeight)
        .background(cell.color)
        .cornerRadius(30)
        .shadow(color: cell.color.opacity(0.3), radius: 20, x: 0, y: 20)
    }
}

let screen = UIScreen.main.bounds
let cellWidth = screen.width * 0.9
let cellHeight = screen.height * 0.7

//Fake Data
let sectionData2 = [
    Cell(title: "First Cell", text: "title", color: Color.red.opacity(0.8)),
    Cell(title: "Second Cell", text: "title", color: Color.red.opacity(0.7)),
    Cell(title: "Third Cell", text: "title", color: Color.red.opacity(0.6))
]
