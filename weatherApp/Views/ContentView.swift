//
//  ContentView.swift
//  weatherApp
//
//  Created by Aljwhra Alnasser on 08/04/1444 AH.
//

import SwiftUI

struct ContentView: View {
    //we will initlize our LocationManager.
   //we added the StateObject property wrapper,so that the view can be notified every time that the published varibles are updated.
    
    @StateObject var locationManager = LocationManager()
    
    var weatherManager = WeatherManager()
    @State var weather: ResponseBody?
    
    var body: some View {
        
        //call the welcomeView
        VStack{
             
            //we need to write an if statement because the location is optional.
            
            if let location = locationManager.location{
                //we will display
                if let weather = weather{
                 WeatherView(weather: weather)
                }else{
                    LoadingView()
                        .task {
                            do{
                               weather =  try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            }catch{
                                print("Error Getting Weather: \(error)")
                            }
                        }
                }
            } else{
                if locationManager.isLoading{
                    LoadingView()
                } else{
                    welcmeView()
                    
                    // add the environment Object modifier and to pass the locationManager if you don't want to run into a crash later on.
                        .environmentObject(locationManager)
                }
                
            }
            
          
        }
        .background(Color(hue: 0.797, saturation: 0.432, brightness: 0.333))
        .preferredColorScheme(.dark)

     
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
