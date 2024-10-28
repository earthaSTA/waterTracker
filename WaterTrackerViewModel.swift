//
//  WaterTrackerViewModel.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 21/04/1446 AH.
//

import SwiftUI


class WaterTrackerViewModel: ObservableObject {
    
    @Published var litersDrinked: Double = 0.0
    @Published var DoubleneededLiters: Double? = nil
    @Published var neededLiters: Double = 2.7
    @Published var maxLiters: Double = 0.0
    @Published var weight: Double = 0.0
    
    
    
    func calcNeededLiters() {
        
        neededLiters = weight*0.03
    }
    
    
    
    func IntakeProgressImage() -> Image {
        
        if litersDrinked == 0 {
            
            return Image(systemName: "zzz")
            
        }
        else if litersDrinked <= (neededLiters/3) {
            return  Image(systemName: "tortoise.fill")
            
        }
        else if litersDrinked < neededLiters  {
            return Image(systemName: "hare.fill")
            
        }
       
        else {
            return  Image(systemName: "hands.clap.fill")
        }
        
    }
}

class NotificationPreferencesViewModel: ObservableObject {
//    @Published var selectedInterval: NotificationPrefMin? = nil
    @Published var selectedInterval2: notificationPrefHour? = nil

    
}


enum NotifiactionPreMin: Int, CaseIterable {
    case fifteen = 15, thirty = 30, sixty = 60, ninety = 90
    
    var Show: String {
        "\(self.rawValue)"
    }
}
    

enum notificationPrefHour: CaseIterable {
    case twoHour, threeHour, fourHour, fiveHour
    
    var durationNotificationHour: String {
        switch self {
            
        case .twoHour: return "2"
            case .threeHour: return "3"
            case .fourHour: return "4"
            case .fiveHour: return "5"
            
        }
    }
}
    
    
    
    
    


