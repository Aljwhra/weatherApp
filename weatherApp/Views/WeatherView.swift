//
//  WeatherView.swift
//  weatherApp
//
//  Created by Aljwhra Alnasser on 11/04/1444 AH.
//

import SwiftUI

struct WeatherView: View {
    var weather: ResponseBody
    var body: some View {
        ZStack(alignment: .leading){
            VStack{
                
                VStack(alignment: .leading, spacing: 5){
                    //add two element
                    Text(weather.name)
                        .bold().font(.title)
                    Text("Tody, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                Spacer()
                
                //This Vstack will contain the icon of the current weather condition.
                VStack{
                    HStack{
                        VStack(spacing: 20){
                            Image(systemName: "cloud")
                                .font(.system(size: 45))
                            Text(weather.weather[0].main)
                        }
                        .frame(width: 150,alignment: .leading)
                        
                        Spacer()
                        
                        Text(weather.main.feelsLike.roundDouble() + "°")
                            .font(.system(size: 50))
                            .fontWeight(.bold)
                            .padding()
                        
                    }
                    Spacer()
                        .frame(height: 80)
                    
                    Image("Riyadh")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 350)
                        .cornerRadius(50)
                    
                    
                placeholder: do {
                    ProgressView()
                }
                    Spacer()
                }
                        .frame(maxWidth: .infinity)
                    
                }
                .padding()
                .frame(maxWidth: .infinity,alignment: .leading)
            VStack{
                Spacer()
                VStack(alignment: .leading, spacing: 20){
                    
                    Text("Weater Now")
                        .bold().padding(.bottom)
                    
                    HStack{
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + "°"))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack{
                        WeatherRow(logo: "wind", name: "Wind spead", value: (weather.wind.speed.roundDouble() + "m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: (weather.main.humidity.roundDouble() + "%"))
                    }
                    
                }
                .frame(maxWidth: .infinity,alignment: .leading)
                .padding()
                .padding(.bottom, 20)
                .foregroundColor(Color(hue: 0.797, saturation: 0.432, brightness: 0.333))
                .background(.white)
                .cornerRadius(20,corners: [.topLeft, .topRight])
            }
            }
            .edgesIgnoringSafeArea(.bottom)
            .background(Color(hue: 0.797, saturation: 0.432, brightness: 0.333))
            .preferredColorScheme(.dark)
        }
    }
    
    struct WeatherView_Previews: PreviewProvider {
        static var previews: some View {
            WeatherView(weather: previewWeather)
        }
    }

