//
//  NotificationPreferencesScreen.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 19/04/1446 AH.
//

import SwiftUI

//
//struct NotificationTime {
//    let notificationPref: String
//}
//let timeInterval = [NotificationTime(notificationPref: "15"), NotificationTime(notificationPref: "30"), NotificationTime(notificationPref: "60"), NotificationTime(notificationPref: "90")]





struct NotificationPreferencesScreen: View {
    
    let MinsInterval = [15, 30, 60, 90]
    let HoursInterval = [2, 3, 4, 5]
    
    @State var Time = Date.now
    
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Notification Preferences")
                .font(.title2)
                .fontWeight(.bold)
            
                .padding()
            
            Text("The Start and End hour")
                .font(.body)
                .fontWeight(.bold)
            
            Text("Specify the start and end date to receive the notifications")
                .font(.callout)
                .foregroundStyle(Color(UIColor.systemGray2))
               
            
            //start and end space
//            VStack {
//                ZStack {
//                    Rectangle()
//                        .frame(width: 355, height: 44)
//                        .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
//                    HStack {
//                        Text("Start hour")
//                            .font(.body)
//                            .fontWeight(.regular)
//                        
//                    }
//                    .padding(.trailing, 240)
//                }
//
//                ZStack {
//                    Rectangle()
//                        .frame(width: 355, height: 44)
//                        .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
//                    HStack {
//                        Text("End hour")
//                            .font(.body)
//                            .fontWeight(.regular)
//                        
//                    }
//                    .padding(.trailing, 240)
//                }
//            }
                
            VStack {
                ZStack {
                    Rectangle()
                        .frame(width: 355, height: 88)
                        .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
                    VStack {
                        HStack(){
                            DatePicker("Start hour", selection: $Time, displayedComponents: .hourAndMinute)
                                .font(.body)
                                .padding(.leading, 20)
                                .padding(.trailing, 15)
                            
                          
                                
                        }
                        Divider()
                            .frame(width: 323, height: 1)
                        HStack() {
                            DatePicker("End hour", selection: $Time, displayedComponents: .hourAndMinute)
                                .font(.body)
                                .padding(.leading, 20)
                                .padding(.trailing, 15)
                              
                                
                        }
                       
                    }
                }
            }
            
            
            
            
            
            
            .padding(.bottom, 30)
            
            
            Text("Notification interval")
                .font(.body)
                .fontWeight(.bold)
            
            Text("How often would you like to receive notifications within the specified time interval")
                .font(.callout)
                .fontWeight(.semibold)
                .foregroundStyle(Color(UIColor.systemGray2))
            VStack {
                HStack {
                    ForEach(MinsInterval, id: \.self){ mins in
                        
                        Button (action: {
                            
                        }){
                            ZStack {
                                Rectangle()
                                    .frame(width: 77, height: 70)
                                    .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
                                    .cornerRadius(6)
                                VStack {
                                    Text("\(mins)")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.cyan)
                                    Text("Mins")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                                
                            }
                        }
                        
                    }
                }
                HStack {
                    ForEach(HoursInterval, id: \.self){ mins in
                        
                        Button (action: {
                            
                        }){
                            ZStack {
                                Rectangle()
                                    .frame(width: 77, height: 70)
                                    .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
                                    .cornerRadius(6)
                                VStack {
                                    Text("\(mins)")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.cyan)
                                    Text("Hours")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(.black)
                                }
                                
                            }
                        }
                        
                    }
                }
                
                
                
                
                
                
                
            }
            .padding()
            
            //
            //
            //                ForEach(timeInterval,id: \.notificationPref) { interval in
            //                    Text(interval.notificationPref)
            //                    Rectangle()
            //                        .frame(width: 77, height: 70)
            
            //
            //            VStack(spacing: -2){
            //                HStack(){
            //                    ZStack {
            //
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("15")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Mins")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //                    }
            //
            //
            //
            //                    ZStack {
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("30")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Mins")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //
            //                    }
            //
            //
            //
            //                    ZStack {
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("60")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Mins")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //
            //                    }
            //
            //
            //                    ZStack {
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("90")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Mins")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //
            //                    }
            //
            //
            //                }
            //                HStack {
            //                    ZStack {
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("2")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Hours")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //
            //
            //
            //                    }
            //                    ZStack {
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("3")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Hours")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //
            //                    }
            //
            //
            //                    ZStack {
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("4")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Hours")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //
            //                    }
            //
            //                    ZStack {
            //                        Rectangle()
            //                            .frame(width: 77, height: 70)
            //                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
            //                            .cornerRadius(6)
            //                        VStack{
            //                            Text("5")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                                .foregroundColor(.cyan)
            //                            Text("Hours")
            //                                .font(.body)
            //                                .fontWeight(.regular)
            //                        }
            //
            //                    }
            //
            //                }
            //                .padding()
            //
            //            }
            //
            //            }
            //
                    .padding(.bottom, 120)
                        Button(action: {
            
                        }) {
            
                            ZStack {
            
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.cyan)
                                    .frame(width: 355, height: 50)
                                Text("Start")
                                    .font(.body)
                                    .fontWeight(.regular)
                                    .foregroundColor(.white)
                            }
            
                        }
            
        }
                                 }
    }
//}

#Preview {
    NotificationPreferencesScreen()
}
