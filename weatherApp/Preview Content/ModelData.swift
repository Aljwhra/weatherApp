//
//  ModelData.swift
//  weatherApp
//
//  Created by Aljwhra Alnasser on 11/04/1444 AH.
//

import Foundation

var previewWeather: ResponseBody = load("weatherData.json")

func load<T: Decodable>(_ filename: String) ->T{
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else{
        fatalError("Could Not Find \(filename) In Main Bundle.")
    }
    do{
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Could Not Load \(filename) From Main Bundle:\n\(error) ")
    }
    do{
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch{
        fatalError("Could Not Parse \(filename) As \(T.self):\n\(error)")
    }
}



