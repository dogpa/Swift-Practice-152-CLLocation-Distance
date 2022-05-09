//
//  ContentView.swift
//  Swift Practice 152 CLLocation Distance
//
//  Created by Dogpa's MBAir M1 on 2022/5/8.
//

import SwiftUI

struct ContentView: View {
    //取得LocationViewModel
    @StateObject var locationVM = LocationViewModel()
    
    var body: some View {
        VStack(spacing: 70 ){
            
            //顯示locationVM的distanceStr字串
            Text("\(locationVM.distanceStr)")
                .multilineTextAlignment(.center)
                .font(.system(size: 30))
                .padding()
                .background(locationVM.distanceStr == "" ? .clear : .green)
            
            //按下按鈕取得隨機兩地地理位置
            Button(action: {
                locationVM.getDistance()
            }, label: {
                Text("隨機兩地距離")
            })
                .frame(width: 350, height: 70, alignment: .center)
                .background(Capsule().fill(Color.yellow))
                .foregroundColor(.black)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
