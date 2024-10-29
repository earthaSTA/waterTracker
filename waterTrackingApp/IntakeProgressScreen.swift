//
//  IntakeProgressScreen.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 20/04/1446 AH.
//

import SwiftUI

struct IntakeProgressScreen: View {
  
    @ObservedObject var viewModel = WaterTrackerViewModel()
    
    var body: some View {

        HStack {
            VStack(alignment: .leading) {
                Text("Today's Water Intake")
                    .font(.callout)
                    .foregroundStyle(Color(.systemGray2))
                
                if viewModel.litersDrinked == viewModel.neededLiters {}
                
                HStack {
                    
                    Text("\(String(format: "%.1f", viewModel.litersDrinked)) liter")
                    
                        .foregroundStyle(Color(viewModel.litersDrinked == viewModel.neededLiters ? .green : .black))
                    
                    Text("/ \(String(format: "%.1f", viewModel.neededLiters)) liter")
                }
                .font(.title2)
                                   .fontWeight(.bold)
                
            }
            .padding()
            Spacer()
        }
        .padding(.bottom, 70)
            
        
        
        
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
                    .trim(from: 0, to: viewModel.litersDrinked / viewModel.neededLiters)
                    .stroke(style: StrokeStyle(lineWidth: 25, lineCap: .round))
                    .fill(Color.cyan)
                    .frame(width: 313, height: 313)
                
                Circle()
                    .frame(width: 313, height: 313)
                    .foregroundColor(Color.white)
                
                
                viewModel.IntakeProgressImage()
                
                    .resizable()
                    .frame(width: 122.07, height: 140)
                    .foregroundStyle(Color(.systemYellow))
                
            }
            
        

            
            
            .padding(.bottom, 70)
            
            
            
            
            
            
            
            
      
        
        VStack(spacing: 0){
            Text("\(String(format: "%.1f", viewModel.litersDrinked)) L")
                .font(.title2)
                .fontWeight(.bold)
            
            HStack {
               
                Stepper(value: $viewModel.litersDrinked , in: 0...viewModel.neededLiters, step: 0.10){}
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
