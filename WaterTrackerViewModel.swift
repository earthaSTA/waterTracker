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
        else if litersDrinked <= (neededLiters * (3/2)){
            return Image(systemName: "hare.fill")
           
        }
        else {

            return  Image(systemName: "hands.clap.fill")
            
        }
        
        
        
    }
    
    
}

