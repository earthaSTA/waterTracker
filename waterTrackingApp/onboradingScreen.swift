import SwiftUI

struct OnboardingScreen: View {
    
    @State public var weight: String = ""
    var body: some View {
        NavigationView {
            
            VStack {
                Spacer() // Push everything above this to the top
                
                
                HStack {
                    VStack {
                        Image(systemName: "drop.fill")
                            .resizable()
                            .frame(width: 50, height: 75)
                            .foregroundColor(.cyan)
                            .padding(.top)
                        
                        Text("Hydrate")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .frame(width: 80, height: 28)
                    }
                    .padding(.leading)
                    Spacer() // Pushes the drop to the left
                }
                
                
                VStack {
                    Text("Start with Hydrate to record and track your water intake daily based on your needs and stay hydrated")
                        .font(.body)
                        .fontWeight(.regular)
                        .foregroundColor(Color(red: 0.388, green: 0.388, blue: 0.401))
                        .multilineTextAlignment(.leading)
                    
                    ZStack {
                        TextField("Body weight", text: $weight)
                            .padding()
                            .background(Color(UIColor.systemGray6))
                            .foregroundColor(.black)
                            .cornerRadius(3)
                            .accentColor(.cyan)
                            .padding()
                        
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.gray)
                            .padding(.leading, 265) // Position the "x" to the right
                    }
                }
                .padding()
                
                Spacer() // Pushes everything above this to the top
                
                
                //                Button(action: {
                NavigationLink(destination: NotificationPreferencesScreen()) {
                    //                }) {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.cyan)
                            .frame(width: 355, height: 50)
                        Text("Next")
                            .font(.body)
                            .fontWeight(.regular)
                            .foregroundColor(.white)
                    }
                
            }
                .padding(.bottom)
                
            }
            .padding()
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    OnboardingScreen(weight: "")
}
