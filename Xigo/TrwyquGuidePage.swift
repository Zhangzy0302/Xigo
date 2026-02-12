//
//  ContentView.swift
//  Xigo
//
//  Created by yangyang on 2026/2/12.
//

import SwiftUI

struct TrwyquGuidePage: View {
    var body: some View {
        ZStack{
            GeometryReader { geo in
                Image("klahgw_guide_pabg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                    .clipped()
            }
            LinearGradient(stops: <#T##[Gradient.Stop]#>, startPoint: <#T##UnitPoint#>, endPoint: <#T##UnitPoint#>)
        }
        
    }
}

#Preview {
    TrwyquGuidePage()
}
