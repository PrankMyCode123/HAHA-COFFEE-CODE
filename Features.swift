//
//  Features.swift
//  HAHACOFFEE
//
//  Created by Đinh Trung Quốc Anh on 21/9/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Features: Hashable, Codable, Identifiable {
    var id: Int
    var drinkName: String
    var price: String
    var description: String
    var ingredients: String 
    
    var category: Category
    enum Category: String, CaseIterable, Codable {
        case bestsellers = "BÁN CHẠY NHẤT ✨"
        case foryou = "DÀNH CHO BẠN ✨"
        case musttry = "MÓN NGON PHẢI THỬ ✨"
        case program = "SỰ KIỆN ✨"
    }
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
    

