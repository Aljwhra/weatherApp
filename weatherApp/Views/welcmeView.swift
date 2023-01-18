//
//  welcmeView.swift
//  weatherApp
//
//  Created by Aljwhra Alnasser on 08/04/1444 AH.
//

import SwiftUI
//we need to import CoreLocationUI,because the Location Button comes this frameWork.
import CoreLocationUI

struct welcmeView: View {
    //we will add an environment object at the top of the struct.
    @EnvironmentObject var locationManager: LocationManager
    var body: some View {
        
        VStack{
            
            VStack(spacing: 20){
                Text("Welcome To The Weather App")
                    .bold().font(.title)
                Text("Please Share Your Current Location To Get The Weather In Your area ")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            
            LocationButton(.shareCurrentLocation){
                // inside of this closure will be the action that we want to perform when the user clicks on Button.
                
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct welcmeView_Previews: PreviewProvider {
    static var previews: some View {
        welcmeView()
    }
}
