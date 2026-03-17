import SwiftUI
import PhotosUI

struct MznaujucChatRoom: View {
    let mznaujucRoomId: Int
    @EnvironmentObject var mznauNaiv: UxzuaNaaviManer
    @EnvironmentObject var maznuaChatVM: SswzuLwoqxChatViewModel
    @EnvironmentObject var mazuaUserVM: XawuxLAiwMUSerViewModel
    
    @State private var mzmakTExt: String = ""
    @FocusState private var mzmakjIsFocus: Bool
    @State private var runUDwalsjImagePickerItem: PhotosPickerItem?  // 多选
    
    var mznauChatUserInfo: XawuxLAiwMUSer? {
        maznuaChatVM.getSswzuLwoqxChatUserInfo(chatRoomId: mznaujucRoomId)
    }
    
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
                        if let mznauUser = mznauChatUserInfo {
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
                                
                                SkahwuLwXImage(SkahwuLwXImageUrl: mznauUser.xawuxLAiwMAvatar, SkahwuLwXWidth: 38, SkahwuLwXHeight: 38)
                                    .clipShape(Circle())
                                Text(mznauUser.xawuxLAiwMUserName)
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                    .foregroundColor(.white)
                                    .padding(.leading, 10)
                            }
                            
                            Spacer()
                            PhotosPicker(
                                selection: $runUDwalsjImagePickerItem,
                                matching: .images
                            ){
                                Image("bneukAJwklImage")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                    .padding(.trailing, 16)
                            }.onChange(of: runUDwalsjImagePickerItem) { item in
                                guard let item else { return }
                                
                                Task {
                                    if let data = try? await item.loadTransferable(type: Data.self),
                                       let image = UIImage(data: data) {
                                        
                                        // 1️⃣ 保存到本地
                                        if let localPath = XigoLocalImageManager.saveXigoImage(image) {
                                            maznuaChatVM.addMessage(sendMsg: SswzuLwoqxMessage(nuwzawiGhrdcjsRoomId: mznaujucRoomId, sswzuLwoqxSendUserId: mazuaUserVM.currentUserID, sswzuLwoqxTextMsg: "", sswzuLwoqxImageMsg: localPath, sswzuLwoqxAudioMsg: "", sswzuLwoqxAudioTime: "", sswzuLwoqxDate: Date()))
                                        }
                                    }
                                }
                            }
                            Image(systemName: "ellipsis")
                                .font(.system(size: 20))
                                .foregroundColor(.white)
                                .frame(width: 42, height: 42)
                                .background(Circle().fill(.white.opacity(0.2)))
                                .onTapGesture {
                                    mznauNaiv.uznasShowBLock(mznauUser.xawuxLAiwMUserId)
                                }
                        }
                        
                    }
                }.padding(.horizontal, 20)
                
                ZStack{
                    UnevenRoundedRectangle(topLeadingRadius: 20, topTrailingRadius: 20)
                        .fill(.white)
                        .ignoresSafeArea()
                    VStack{
                        if let mznhatUserInfo = mznauChatUserInfo {
                            MznajucMsgList(mznauChatUserInfo: mznhatUserInfo)
                                .frame(maxHeight: .infinity)
                                .padding(.top, 10)
                        }
                        
                        HStack{
                            TextField("", text: $mzmakTExt, prompt: Text("Say something")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255)))
                                .focused($mzmakjIsFocus)
                                .tint(.white)
                                .font(XigexcTheme.XigoFont.xiabalMainFont(14))
                                .foregroundColor(.white)
                            Image("klahgw_send")
                                .resizable()
                                .renderingMode(.template)
                                .foregroundColor(.white)
                                .frame(width: 34, height: 34)
                                .onTapGesture {
                                    if !mzmakTExt.isEmpty {
                                        maznuaChatVM.addMessage(sendMsg: SswzuLwoqxMessage(nuwzawiGhrdcjsRoomId: mznaujucRoomId, sswzuLwoqxSendUserId: mazuaUserVM.currentUserID, sswzuLwoqxTextMsg: mzmakTExt, sswzuLwoqxImageMsg: "", sswzuLwoqxAudioMsg: "", sswzuLwoqxAudioTime: "", sswzuLwoqxDate: Date()))
                                        mzmakTExt = ""
                                    }
                                }
                        }.padding(.horizontal, 11)
                            .padding(.vertical, 9)
                            .frame(height: 54)
                            .background(RoundedRectangle(cornerRadius: 30))
                            .padding(.horizontal, 20)
                            .padding(.bottom, 30)
                            .padding(.top, 8)
                            .ignoresSafeArea()
                    }
                    
                }
            }
        }.onTapGesture {
            mzmakjIsFocus = false
        }.navigationBarHidden(true)
            .background(XiwanEnableSwipeBack())
            .onAppear{
                maznuaChatVM.getSswzuLwoqxMessageListByChatId(chatRoomId: mznaujucRoomId)
            }
    }
    
    struct MznajucMsgList: View {
        let mznauChatUserInfo: XawuxLAiwMUSer
        @EnvironmentObject var mznauNaiv: UxzuaNaaviManer
        @EnvironmentObject var maznuaChatVM: SswzuLwoqxChatViewModel
        @EnvironmentObject var mazuaUserVM: XawuxLAiwMUSerViewModel
        
        let format = DateFormatter()
        
        func formatTime(_ time: Date) -> String {
            format.dateFormat = "hh:mm"
            format.locale = Locale.current
            return format.string(from: time)
        }
        
        var body: some View {
            ScrollView{
                LazyVStack{
                    ForEach(maznuaChatVM.chatMessageList) { msg in
                        VStack{
                            if !msg.sswzuLwoqxTextMsg.isEmpty {
                                if msg.sswzuLwoqxSendUserId == mznauChatUserInfo.xawuxLAiwMUserId {
                                    HStack(alignment: .top, spacing: 10){
                                        SkahwuLwXImage(SkahwuLwXImageUrl: mznauChatUserInfo.xawuxLAiwMAvatar)
                                        VStack(alignment: .leading, spacing: 4){
                                            Text(msg.sswzuLwoqxTextMsg)
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
                                            Text(formatTime(msg.sswzuLwoqxDate))
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                                        }
                                        Spacer()
                                    }
                                }else {
                                    HStack(alignment: .top, spacing: 10){
                                        Spacer()
                                        
                                        VStack(alignment: .trailing, spacing: 4){
                                            Text(msg.sswzuLwoqxTextMsg)
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
                                            Text(formatTime(msg.sswzuLwoqxDate))
                                                .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                                .foregroundColor(Color(red: 153/255, green: 153/255, blue: 153/255))
                                        }
                                        if let myfino = mazuaUserVM.currentUser {
                                            SkahwuLwXImage(SkahwuLwXImageUrl: myfino.xawuxLAiwMAvatar, SkahwuLwXWidth: 36, SkahwuLwXHeight: 36)
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                            }else if !msg.sswzuLwoqxImageMsg.isEmpty {
                                if msg.sswzuLwoqxSendUserId == mznauChatUserInfo.xawuxLAiwMUserId {
                                    HStack(alignment: .top, spacing: 10){
                                        SkahwuLwXImage(SkahwuLwXImageUrl: mznauChatUserInfo.xawuxLAiwMAvatar)
                                        SkahwuLwXImage(SkahwuLwXImageUrl: msg.sswzuLwoqxImageMsg, SkahwuLwXWidth: 160)
                                            .cornerRadius(20)
                                        Spacer()
                                    }
                                }else {
                                    HStack(alignment: .top, spacing: 10){
                                        Spacer()
                                        
                                        SkahwuLwXImage(SkahwuLwXImageUrl: msg.sswzuLwoqxImageMsg, SkahwuLwXWidth: 160)
                                            .cornerRadius(20)
                                        if let myfino = mazuaUserVM.currentUser {
                                            SkahwuLwXImage(SkahwuLwXImageUrl: myfino.xawuxLAiwMAvatar, SkahwuLwXWidth: 36, SkahwuLwXHeight: 36)
                                                .clipShape(Circle())
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                }.padding(.top, 20)
                    .padding(.bottom, 30)
            }.frame(maxHeight: .infinity)
                .padding(.horizontal, 20)
        }
    }
}
