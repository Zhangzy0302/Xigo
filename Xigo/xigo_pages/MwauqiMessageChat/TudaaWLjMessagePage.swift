import SwiftUI

struct TudaaWLjMessagePage: View {
    
    @EnvironmentObject var tudaawalChatVm: SswzuLwoqxChatViewModel
    
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
                if tudaawalChatVm.myChatRooms.isEmpty {
                    XigexNoawEmptyData(xigoexTopPadding: 50)
                }else{
                    ScrollView {
                        LazyVStack(spacing: 16){
                            ForEach(tudaawalChatVm.myChatRooms) {room in
                                TudaaANiMessageItem(tudaaAniMsRoomItem: room)
                            }
                        }.padding(.horizontal, 20)
                            .padding(.top, 20)
                            .padding(.bottom, 40)
                    }
                }
                
            }
        }.navigationBarHidden(true)
            .background(EnableSwipeBack())
            .onAppear{
                tudaawalChatVm.getMySswzuLwoqxChatRoomsNotBlock()
            }
    }
    
    struct TudaaANiMessageItem: View {
        @EnvironmentObject var tudaaNAvi: UxzuaNaaviManer
        @EnvironmentObject var tudaawalChatVm: SswzuLwoqxChatViewModel
        let formatter = DateFormatter()
        
        let tudaaAniMsRoomItem: SswzuLwoqxChatRoom
        var body: some View {
            HStack(spacing: 12){
                if let tuadnWialUserInfo = tudaawalChatVm.getSswzuLwoqxChatUserInfo(chatRoomId: tudaaAniMsRoomItem.sswzuLwoqxRoomId) {
                    Circle()
                        .fill(Color(red: 1, green: 35/255, blue: 156/255).opacity(0.2))
                        .frame(width: 70, height: 70)
                        .overlay{
                            SkahwuLwXImage(SkahwuLwXImageUrl: tuadnWialUserInfo.xawuxLAiwMAvatar, SkahwuLwXWidth: 62, SkahwuLwXHeight: 62)
                                .clipShape(Circle())
                        }
                    VStack(alignment: .leading, spacing: 7){
                        Text(tuadnWialUserInfo.xawuxLAiwMUserName)
                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                            .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                            .lineLimit(1)
                        Text(tudaaAniMsRoomItem.sswzuLwoqxLastSendMsg)
                            .font(XigexcTheme.XigoFont.xiabalMainFont(16, weight: .black))
                            .foregroundColor(Color(red: 51/255, green: 51/255, blue: 51/255))
                            .lineLimit(1)
                    }
                    Spacer()
                    VStack(alignment: .trailing){
                        Text(formatter.string(from: tudaaAniMsRoomItem.sswzuLwoqxLastSendTime))
                            .font(XigexcTheme.XigoFont.xiabalMainFont(10))
                            .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                            .lineLimit(1)
                    }
                }
                
            }.padding(6)
                .padding(.trailing, 14)
                .background(RoundedRectangle(cornerRadius: 41).fill(.white))
                .onTapGesture {
                    tudaaNAvi.push(UxzuaAppRoute.mznajucChatRoom(mzanRoomId: tudaaAniMsRoomItem.sswzuLwoqxRoomId))
                }
        }
    }
}
