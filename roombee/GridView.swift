//
//  GridView.swift
//  roombee
//
//  Created by Adwait Ganguly on 10/7/23.
//

import SwiftUI

struct GridView: View {
    var cal: CalendarView
    var cal2: CalendarView
    
    var body: some View {
        let date: Date = dateFrom(9, 5, 2023)
        VStack{
            HStack {
                Text(date.formatted(.dateTime.day().month()))
                    .bold()
                Text(date.formatted(.dateTime.year()))
            }
            .font(.title)
            Text(date.formatted(.dateTime.weekday(.wide)))
            
            Grid() {
                GridRow {
                    cal
                    cal2
                }
            }
        }
    }
}

struct GridView_Previews: PreviewProvider {
    static var previews: some View {
        GridView(cal: CalendarView(title: "Me"), cal2: CalendarView(title: "Roomate"))
    }
}
