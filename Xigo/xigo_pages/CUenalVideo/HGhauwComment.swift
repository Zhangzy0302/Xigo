import SwiftUI

struct HGhauwComment: View {
    @Binding var hghaIsShowCOmment: Bool
    
    var body: some View {
        ZStack(alignment: .bottom){
            if hghaIsShowCOmment {
                Color.white.opacity(0.01).ignoresSafeArea()
                    .onTapGesture {
                        hghaIsShowCOmment = false
                    }
                VStack{
                    HStack{
                        Text("Comment")
                            .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                            .foregroundColor(.white)
                            .italic(true)
                        Spacer()
                    }.padding(.bottom, 18)
                    ScrollView {
                        LazyVStack(spacing: 12){
                            VStack(spacing: 0){
                                HStack{
                                    Circle()
                                        .frame(width: 34)
                                    VStack(alignment: .leading, spacing: 2){
                                        Text("Tyrone")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12, weight: .extraBold))
                                            .foregroundColor(.white)
                                        Text("2024.4.18  14:35:17")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(10))
                                            .foregroundColor(.white)
                                    }
                                    Spacer()
                                    Image(systemName: "ellipsis")
                                        .font(.system(size: 16))
                                        .foregroundColor(.black)
                                        .frame(width: 32, height: 20)
                                        .background(RoundedRectangle(cornerRadius: 20).fill(.white))
                                }.padding(.bottom, 10)
                                Text("This was exactly what I needed tonight. Instant calm. Thank you 💙")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                    .foregroundColor(.white)
                                    .padding(.bottom, 12)
                                Rectangle()
                                    .fill(.white.opacity(0.5))
                                    .frame(height: 1)
                                
                            }
                        }.padding(.bottom, 34)
                    }
                }.padding(.horizontal, 20)
                    .padding(.top, 12)
                    .frame(height: 400)
                    .background(
                        UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20)
                            .fill(.black)
                            .overlay{
                                ZStack(alignment: .topTrailing){
                                    Image("klahgw_comment_list")
                                        .resizable()
                                        .frame(width: 38, height: 28)
                                        .padding(.trailing, 36)
                                }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            }
                    )
            }
           
        }.ignoresSafeArea()
            .transition(.slide)
            .animation(.easeOut, value: hghaIsShowCOmment)
        
    }
}
