import SwiftUI

struct TudaaWLjMessagePage: View {
    @EnvironmentObject var tudaaNAvi: UxzuaNaaviManer
    var body: some View {
        ZStack(alignment: .top){
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            VStack{
                IEyabZHskTopBar()
                ScrollView {
                    LazyVStack(spacing: 16){
                        HStack(spacing: 12){
                            Circle()
                                .fill(Color(red: 1, green: 35/255, blue: 156/255).opacity(0.2))
                            VStack(alignment: .leading, spacing: 7){
                                Text("Stanley William")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                                Text("Photo story photo story stst ")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                                    .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                                    .lineLimit(1)
                            }
                            Spacer()
                            VStack(alignment: .trailing){
                                Text("03:52 PM")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(10))
                                    .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                                    .lineLimit(1)
                            }
                        }.padding(6)
                            .padding(.trailing, 14)
                            .background(RoundedRectangle(cornerRadius: 41).fill(.white))
                            .onTapGesture {
                                tudaaNAvi.push(UxzuaAppRoute.mznajucChatRoom)
                            }
                    }.padding(.horizontal, 20)
                        .padding(.top, 20)
                        .padding(.bottom, 40)
                }
            }
        }.navigationBarHidden(true)
    }
}
