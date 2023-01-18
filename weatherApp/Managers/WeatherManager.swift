//
//  WeatherManager.swift
//  weatherApp
//
//  Created by Aljwhra Alnasser on 11/04/1444 AH.
//

import Foundation
import CoreLocation

class WeatherManager{
    
    //we will add one function called getCurrentWeather
    
    //this function will accept tow arguments
    //function use the new async await method introduced at WWDC21.
    func getCurrentWeather(latitude: CLLocationDegrees , longitude: CLLocationDegrees) async throws -> ResponseBody {
        
        //add agurd ststement at the top.
        // if we don't have a URL, we will throw a fatal error that says Missing URL.
        //This will be the URL endpoint that we will call in order to get the data from the API.
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=\("put your Api")&units=metric")
        else {fatalError("Missing URL")}
        
        //we need to create a URL repuest.
        
        let urlRequest = URLRequest(url: url)
        
        //we will to try await URL session dot shared.
        
        let (data , response) = try await URLSession.shared.data(for:urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode==200 else{fatalError("Error Fatching Weather Data")}
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        print(decodedData)
         return decodedData
        
    }
    
}

// Model of the response body we get from calling the OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
