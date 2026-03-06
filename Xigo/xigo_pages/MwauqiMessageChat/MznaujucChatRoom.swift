import SwiftUI

struct MznaujucChatRoom: View {
    @EnvironmentObject var mznauNaiv: UxzuaNaaviManer
    
    @State private var mzmakTExt: String = ""
    @FocusState private var mzmakjIsFocus: Bool
    
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
            VStack(spacing: 20){
                HStack{
                    HStack {
                        HStack(spacing: 0){
                            Image(systemName: "chevron.left")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(width: 42, height: 42)
                                .background{
                                    Circle()
                                        .fill(.white.opacity(0.2))
                                        
                                }.onTapGesture {
                                    mznauNaiv.pop()
                                }.padding(.trailing, 6)
                            
                            Circle()
                                .frame(width: 38)
                            Text("Apien")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                .foregroundColor(.white)
                                .padding(.leading, 10)
                        }
                        
                        Spacer()
                        Image("bneukAJwklImage")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .padding(.trailing, 16)
                        Image(systemName: "ellipsis")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .frame(width: 42, height: 42)
                            .background(Circle().fill(.white.opacity(0.2)))
                    }
                }.padding(.horizontal, 20)
                
                ZStack{
                    UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20)
                        .fill(.white)
                    ScrollView{
                        LazyVStack{
                            VStack{
                                HStack(alignment: .top, spacing: 10){
                                    Circle()
                                        .frame(width: 36)
                                    VStack(alignment: .leading, spacing: 4){
                                        Text("Hello, I am interested in your stuff.")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(
                                                UnevenRoundedRectangle(
                                                    topLeadingRadius: 0,
                                                    bottomLeadingRadius: 10,
                                                    bottomTrailingRadius: 10,
                                                    topTrailingRadius: 10
                                                ).fill(XigexcTheme.XigoColor.xiabalMainPink)
                                            )
                                        Text("12:00")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                            .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                                    }
                                    Spacer()
                                }
                                HStack(alignment: .top, spacing: 10){
                                    Spacer()
                                    
                                    VStack(alignment: .trailing, spacing: 4){
                                        Text("Hello, I am interested in your stuff.")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                            .foregroundColor(.white)
                                            .padding(10)
                                            .background(
                                                UnevenRoundedRectangle(
                                                    topLeadingRadius: 10,
                                                    bottomLeadingRadius: 10,
                                                    bottomTrailingRadius: 10,
                                                    topTrailingRadius: 0
                                                ).fill(XigexcTheme.XigoColor.xiabalMainPurple)
                                            )
                                        Text("12:00")
                                            .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                            .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                                    }
                                    Circle()
                                        .frame(width: 36)
                                }
                            }
                        }
                    }.frame(maxHeight: .infinity)
                    
                    HStack{
                        ZStack(alignment: .leading){
                            TextField("", text: $mzmakTExt)
                                .focused($mzmakjIsFocus)
                                .tint(.white)
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .foregroundColor(.white)
                            if (!mzmakjIsFocus && mzmakTExt.isEmpty) {
                                Text("Say something")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                    .foregroundColor(.white)
                            }
                        }
                        Image("klahgw_send")
                            .resizable()
                            .renderingMode(.template)
                            .foregroundColor(.white)
                            .frame(width: 34, height: 34)
                            
                    }.padding(.horizontal, 11)
                        .padding(.vertical, 9)
                        .background(RoundedRectangle(cornerRadius: 30))
                        .padding(.horizontal, 20)
                        .padding(.bottom, 30)
                        .padding(.top, 8)
                }.ignoresSafeArea()
            }
        }.onTapGesture {
            mzmakjIsFocus = false
        }.navigationBarHidden(true)
    }
}

#Preview {
    MznaujucChatRoom()
}
