//
//  NotificationPreferencesScreen.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 19/04/1446 AH.
//

import SwiftUI
import UserNotifications

struct NotificationPreferencesScreen: View {
    
    //selected starttime = date()
    @ObservedObject private var choseenIntervalInstance = NotificationManger()
    @StateObject private var viewModel = NotificationPreferencesViewModel()
    
    //    @ObservedObject var intravalViewModel: NotificationPreferencesViewModel
    @State private var selectedInterval: NotifiactionPreMin?
    @State private var  cLickedState: [NotifiactionPreMin: Bool] = [:] // make each time interval independently
    
    @State private var selectedIntervalHour: NotificationPrefhour?
    @State private var  cLickedStateHour: [NotificationPrefhour: Bool] = [:] // make each time interval independently
    
    
    @State private var IsMinsSelected = false // if this var is not here, the user can tap on mins and hours at the same time
    
    
    @State var startTime: Date = Date()
    @State var endTime: Date = Date()

    
    @State var clicked: Bool = false // mean onTapGesture is not tapped yet
    
    
    
    var body: some View {
        NavigationView {
            
            VStack {
                VStack(alignment: .leading) {
                    Text("Notification Preferences")
                        .font(.title2)
                        .fontWeight(.bold)
                    
                        .padding(.trailing)
                        .padding(.bottom, 30)
                        
                    
                    Text("The Start and End hour")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.bottom, 1)
                    
                    Text("Specify the start and end date to receive the notifications")
                        .font(.callout)
                        .foregroundStyle(Color(UIColor.systemGray2))
                }
                .padding(.trailing)
                VStack {
                    ZStack {
                        Rectangle()
                            .frame(width: 355, height: 88)
                            .foregroundColor(Color(red: 0.949, green: 0.949, blue: 0.971))
                        VStack {
                            HStack(){
                                DatePicker("Start hour", selection: $startTime, displayedComponents: .hourAndMinute)
                                    .font(.body)
                                    .padding(.leading, 35)
                                    .padding(.trailing, 30)
                                    .padding(.top)
                                
                                
                                
                            }
                            Divider()
                                .frame(width: 323, height: 1)
                            HStack() {
                                DatePicker("End hour", selection: $endTime, displayedComponents: .hourAndMinute)
                                    .font(.body)
                                    .padding(.leading, 35)
                                    .padding(.trailing, 30)
                                    .padding(.bottom)
                                
                                
                            }
                            
                        }
                    }
                }
                
                
                
                
                
                
                .padding(.bottom, 15)
                
                VStack(alignment: .leading) {
                    Text("Notification interval")
                        .font(.body)
                        .fontWeight(.bold)
                        .padding(.bottom, 1)

                    Text("How often would you like to receive notifications within the specified time interval")
                        .font(.callout)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(UIColor.systemGray2))
                        .padding(.bottom, 10)

                }
                VStack {
                    // both hour and min are in here
                    HStack {
                        ForEach(NotifiactionPreMin.allCases, id: \.self) { interval in
                            ZStack {
                                Rectangle()
                                    .frame(width: 77, height: 70)
                                    .foregroundColor(cLickedState[interval] == true ? .cyan : .f2F2F7)
                                    .cornerRadius(6)
                                
                                VStack {
                                    Text("\(interval.Show)")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(cLickedState[interval] == true ? .white : .cyan)
                                        .onTapGesture {
                                            // Reset hour states and set minute state
                                            cLickedStateHour = NotificationPrefhour.allCases.reduce(into: [:]) { $0[$1] = false }
                                            cLickedState = NotifiactionPreMin.allCases.reduce(into: [:]) { $0[$1] = false }
                                            
                                            cLickedState[interval] = true
                                            self.selectedInterval = interval
                                            choseenIntervalInstance.chossenInterval = interval.rawValue // hold the tapped interval in choseenIntervalInstance
                                            IsMinsSelected = true // Mark minutes as selected
                                            
                                            choseenIntervalInstance.ScheduleNotification(IntervalChoice: TimeInterval(interval.rawValue)) //to pass parameters into the function
                                        }
                                    Text("Mins")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(cLickedState[interval] == true ? .white : .black)
                                }
                            }
                        }
                    }
                    HStack {
                        ForEach(NotificationPrefhour.allCases, id: \.self) { interval1 in
                            ZStack {
                                Rectangle()
                                    .frame(width: 77, height: 70)
                                    .foregroundColor(cLickedStateHour[interval1] == true ? .cyan : .f2F2F7)
                                    .cornerRadius(6)
                                
                                VStack {
                                    Text("\(interval1.showHour)")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(cLickedStateHour[interval1] == true ? .white : .cyan)
                                        .onTapGesture {
                                            // Reset minute states and set hour state
                                            cLickedState = NotifiactionPreMin.allCases.reduce(into: [:]) { $0[$1] = false }
                                            cLickedStateHour = NotificationPrefhour.allCases.reduce(into: [:]) { $0[$1] = false }
                                            
                                            cLickedStateHour[interval1] = true
                                            self.selectedIntervalHour = interval1
                                            IsMinsSelected = false // Mark hours as selected
                                            
                                            choseenIntervalInstance.ScheduleNotification(IntervalChoice: TimeInterval(interval1.rawValue))
                                            
                                        }
                                    Text("Hours")
                                        .font(.body)
                                        .fontWeight(.regular)
                                        .foregroundColor(cLickedStateHour[interval1] == true ? .white : .black)
                                }
                            }
                        }
                    }
                }
            }
            
            
        }
        
        NavigationLink(destination: IntakeProgressScreen()){
            
            ZStack {
                //
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.cyan)
                    .frame(width: 355, height: 50)
                Text("Start")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
            }
            
        }
        
        //        .navigationBarBackButtonHidden()
        .onAppear() {
            NotificationManger.notifiInstance.requestNotification()
            
            if let selectedInterval = choseenIntervalInstance.chossenInterval {
                NotificationManger.notifiInstance.ScheduleNotification(IntervalChoice: TimeInterval(selectedInterval))
            }
            
            
        }
    }
}
                                 
    


#Preview {
    NotificationPreferencesScreen()
}
