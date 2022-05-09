//
//  LocationViewModel.swift
//  Swift Practice 152 CLLocation Distance
//
//  Created by Dogpa's MBAir M1 on 2022/5/8.
//


import MapKit

final class LocationViewModel: ObservableObject {
    
    //被觀察物件，存入指定顯示的字串內容
    @Published var distanceStr = ""
    
    //自定義的Array，存放指定的Model放入相關的地理位置資訊與經緯度座標
    private var locations : [Location] = [
    Location(locationName: "南京中山路口", location: CLLocation(latitude: 25.05209613290682, longitude: 121.52262644205325)),
    Location(locationName: "佳德鳳梨酥", location:  CLLocation(latitude: 25.05149309289402, longitude: 121.56136908217748)),
    Location(locationName: "雙連捷運站", location: CLLocation(latitude: 25.057665287774267, longitude: 121.52070258908108)),
    Location(locationName: "武嶺", location: CLLocation(latitude: 24.13841623015346, longitude: 121.27613231089555)),
    Location(locationName: "玉山", location:  CLLocation(latitude:  23.47144414607863, longitude: 120.9565614647542)),
    Location(locationName: "台北101", location:  CLLocation(latitude:   25.034124805468366, longitude: 121.56459742830336)),
    Location(locationName: "誠品信義", location:  CLLocation(latitude:   25.040111912498237, longitude: 121.56530375802147)),
    Location(locationName: "國父紀念館", location:  CLLocation(latitude:   25.04023173572094, longitude: 121.56025206624714)),
    Location(locationName: "捷運市政府站", location:  CLLocation(latitude:   25.04119811626383, longitude: 121.56660227488725))
    ]
    
    ///隨機排列locations並以第一個值為基準
    ///判斷第一個地理位置與第二個地理位置的指定距離
    ///直線距離的結果透過自訂義Function getKOrKMDString判斷顯示公里還是公尺
    func getDistance () {
        locations.shuffle()
        let distance = locations[0].location.distance(from: locations[1].location)
        distanceStr = "\(locations[0].locationName) \n與\n\(locations[1].locationName) \n直線距離為\n\n \(getKOrKMDString(distance: distance))"
    }
    
    
    /// 若直線距離大於1000則除1000並顯示公里
    /// 小於1000則顯示公司
    /// 統一顯示小數點三位數
    ///  - Parameters :
    ///      - distance : 直線距離的Double值
    /// - Returns: 回傳指定字串Double大於1000回傳公里，小於則回傳公尺
    func getKOrKMDString (distance: Double) -> String {
        if distance > 1000 {
            return "\(String(format: "%.3f", distance/1000)) 公里"
        }else{
            return "\(String(format: "%.3f", distance)) 公尺"
        }
    }

    
}
