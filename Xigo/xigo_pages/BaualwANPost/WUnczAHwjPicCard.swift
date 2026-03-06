import SwiftUI

struct WUnczAHwjPicCard: View {
    var body: some View {
        VStack(spacing: 12){
            HStack(spacing: 0) {
                Circle()
                    .frame(width: 45)
                Text("Tyrone")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(18, weight: .extraBold))
                    .foregroundColor(.black)
                    .padding(.leading, 13)
                Spacer()
                Image(systemName: "ellipsis")
                    .font(.system(size: 16))
                    .foregroundColor(.black)
                    .frame(width: 32, height: 20)
                    .background(RoundedRectangle(cornerRadius: 20).fill(.white))
            }
            VStack(spacing: 8){
                HStack{
                    
                }
                Text("Time to relax and unwind 🌌Put on your headphones and let the tingles begin…#ASMR #SleepAid #RelaxingSounds")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                    .foregroundColor(Color(red: 51 / 255, green: 52 / 255, blue: 51 / 255))
            }
            VStack {
                HStack {
                    Text("Tyrone")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                        .foregroundColor(.black)
                    Spacer()
                    HStack(spacing: 4) {
                        
                        Image("klahgw_heart")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.black)
                            .frame(width: 20, height: 20)
                        Text("122")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                            .foregroundColor(.black)
                    }
                }
                Rectangle()
                    .fill(Color(red: 102 / 255, green: 102 / 255, blue: 102 / 255))
                    .frame(height: 1)
            }
        }.padding(.horizontal, 20)
    }
}
