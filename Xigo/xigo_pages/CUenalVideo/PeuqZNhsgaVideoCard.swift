import SwiftUI

struct PeuqZNhsgaVideoCard: View {
    var body: some View {
        VStack(spacing: 16) {
            VStack(spacing: 0) {
                HStack(spacing: 0) {
                    Circle()
                        .frame(width: 34)
                    VStack(alignment: .leading) {
                        Text("Tyrone")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                            .foregroundColor(.black)
                        Text("2024.4.18  14:35:17")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                            .foregroundColor(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
                    }.padding(.leading, 12)
                    Spacer()
                    
                }.padding(.bottom, 10)
                Text("Time to relax and unwind 🌌Put on your headphones and let the tingles begin…#ASMR #SleepAid #RelaxingSounds")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                    .foregroundColor(Color(red: 51 / 255, green: 51 / 255, blue: 51 / 255))
            }
            RoundedRectangle(cornerRadius: 20)
                .frame(height: 219)
                .overlay{
                    Image("akklahgwwl_play")
                        .resizable()
                        .frame(width: 36, height: 36)
                }
            Rectangle()
                .fill(Color(red: 153 / 255, green: 153 / 255, blue: 153 / 255))
                .frame(height: 1)
            HStack {
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
                HStack(spacing: 4) {
                    
                    Image("klahgw_comment")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                    Text("122")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                        .foregroundColor(.black)
                }
                HStack(spacing: 4) {
                    
                    Image("klahgw_aiwna")
                        .resizable()
                        .renderingMode(.template)
                        .foregroundColor(.black)
                        .frame(width: 20, height: 20)
                    Text("122")
                        .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                        .foregroundColor(.black)
                }
            }
        }.padding(16).background(.white)
            .cornerRadius(20)
            .shadow(color: .black.opacity(0.25), radius: 4, x: 0, y: 2)
            .padding(.horizontal, 20)
            .padding(.top, 3)
        
    }
}
