//
//  onboradingScreen.swift
//  waterTrackingApp
//
//  Created by Danah Alsultan on 17/04/1446 AH.
//

import SwiftUI

struct onboradingScreen: View {
    
    @State var weight: String
    // try
    var body: some View {
        
        VStack {
          
            HStack {
                VStack(){
                    
                    
                    Image(systemName: "drop.fill")
                        .resizable()
                        .frame(width: 50, height: 75)
                        .foregroundColor(.cyan)
                    Text("Hydrate")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .frame(width: 80, height: 28)
                    
                }
                .padding(.leading, 28)
                Spacer()
            }
            
            
            VStack {
                
                Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(Color(red: 0.388, green: 0.388, blue: 0.401))
                
                
                
                ZStack {
                    
                    
                    TextField("Body weight", text: $weight)
                        .padding()
                        .background(Color(UIColor.systemGray6))
                        .foregroundColor(.black)
                        .cornerRadius(3)
                        .padding()
                    
                    
                    Image(systemName: "x.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.leading, 250)
                    
                    
                }
              
            }
                
                
                Spacer()
            }
            .padding()
            Button (action: {
                
            }){
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.cyan)
                        .frame(width: 355, height: 50)
                    Text("Next")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.white)
                    
                    
                }
            }
            
        
        
        Spacer()
        
    }
    }


#Preview {
    onboradingScreen(weight: "")
}
