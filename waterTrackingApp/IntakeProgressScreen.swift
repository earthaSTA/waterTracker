//
//  IntakeProgressScreen.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 20/04/1446 AH.
//

import SwiftUI

// WaterTrackerViewModel.litersDrinked
// WaterTrackerViewModel.neededLiters

struct IntakeProgressScreen: View {
  
  @ObservedObject var viewModel = WaterTrackerViewModel()
    
    var body: some View {
       
       
        
        
        HStack {
            VStack(alignment: .leading) {
                Text("Today's Water Intake")
                    .font(.callout)
                    .foregroundStyle(Color(.systemGray2))
                
                Text("\(String(format: "%.1f", viewModel.litersDrinked)) / \(String(format: "%.1f", viewModel.neededLiters))")
                    .font(.title2)
                    .fontWeight(.bold)
                
            }
            .padding()
            Spacer()
        }

            
            ZStack {
                Circle()
                // outer
                    .frame(width: 347, height: 347)
                    .foregroundColor(Color(.systemGray6))
                Circle()
                //inner
                    .stroke()
                    .frame(width: 313, height: 313)
                    .foregroundColor(Color(.systemGray6))
                Circle()
                // for white background
                    .frame(width: 313, height: 313)
                    .foregroundColor(Color.white)

                
                viewModel.IntakeProgressImage()
                
                                    .resizable()
                                                           .frame(width: 122, height: 140)
                                                           .foregroundStyle(Color(.systemYellow))
                
            }
        
      
            
            
            
            
            
            
            
            
            
            
            
            
      
        
        VStack(spacing: 0){
            Text("\(String(format: "%.1f", viewModel.litersDrinked)) L")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
               
                Stepper(value: $viewModel.litersDrinked , in: 0...30, step: 0.20){}
                    .frame(width: 94, height: 32)
                    .padding(.trailing)
                   
             
            }
            
            .padding()
        }
        
        
       
    }
}


#Preview {
    IntakeProgressScreen()
}
