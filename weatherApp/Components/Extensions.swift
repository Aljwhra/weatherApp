//
//  Extensions.swift
//  weatherApp
//
//  Created by Aljwhra Alnasser on 11/04/1444 AH.
//

import Foundation
import SwiftUI

//we need to create an extension on double
extension Double{
    
    //create function
    func roundDouble() -> String {
        //That means that we will round the double ,on which we call the roundDouble function ,to zero decimals.
        return String (format: "%.0f", self)
    }
    
}

// Extension for adding rounded corners to specific corners

extension View {
    func cornerRadius(_ radius: CGFloat, corners:UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}

// Custom RoundedCorner shape used for cornerRadius extension above
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

