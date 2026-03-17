import SwiftUI
import PhotosUI

struct QawyaXmaEDit: View {
    
    @State private var qawyXmaUserAvatar = ""
    @State private var qawayText: String = ""
    @FocusState private var qawayIsFocus: Bool
    
    @EnvironmentObject var qaawnzUserVm: XawuxLAiwMUSerViewModel
    @EnvironmentObject var qzaliNavi: UxzuaNaaviManer
    
    @State private var selectedItem: PhotosPickerItem?
    @State private var tjriwncAJShowAvatarPicker = false
    
    var body: some View {
        ZStack(alignment: .top) {
            GeometryReader { geo in
                Image("klahgw_main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(maxHeight: .infinity)
                    .clipped()
                    .ignoresSafeArea()
                    
            }
            Image("klahgw_change_avatar")
                .resizable()
                .frame(width: 72, height: 97)
                .padding(.top, 30)
                .padding(.leading, 100)
            VStack {
                IEyabZHskTopBar(iealkaTitle: "Edit information")
                ZStack(alignment: .top){
                    ZStack {
                        Circle()
                            .stroke(.white.opacity(0.7), lineWidth: 1)
                            .frame(width: 98, height: 98)
                        SkahwuLwXImage(SkahwuLwXImageUrl: qawyXmaUserAvatar, SkahwuLwXWidth: 84, SkahwuLwXHeight: 84, SkahwuLwXIsCircle: true, SkahwuLwXCircleColor: .white, SkahwuLwXCircleWidth: 2)
                    }.onTapGesture {
                        tjriwncAJShowAvatarPicker = true
                    }
                    Image("xnwuAkuwaka")
                        .resizable()
                        .frame(height: 246)
                        
                        .overlay{
                            VStack(spacing: 24){
                                Text("Nickname")
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                                    .foregroundColor(.black)
                                TextField("Please enter", text: $qawayText)
                                    .focused($qawayIsFocus)
                                    .font(XigexcTheme.XigoFont.xiabalMainFont(12))
                                    .foregroundColor(.white)
                                    .tint(.white)
                                    .padding(.horizontal, 22)
                                    .frame(height: 62)
                                    .background(
                                        RoundedRectangle(cornerRadius: 31)
                                            .fill(.black)
                                    ).onTapGesture {
                                        qawayIsFocus = true
                                    }
                            }.padding(.horizontal, 25)
                        }.padding(.top, 69)
                }.padding(.horizontal, 20)
                    .padding(.top, 70)
                Spacer()
                if !qawayIsFocus {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(.black)
                        .frame(width: 144, height: 47)
                        .overlay{
                            Text("Save")
                                .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                                .foregroundColor(.white)
                        }.onTapGesture {
                            if qawayText.isEmpty {
                                DwhaiXeuHUD.toast(.error("Username is required"))
                                return
                            }
                            qaawnzUserVm.editXawuxLAiwMUserInfo(name: qawayText, avatar: qawyXmaUserAvatar)
                            DwhaiXeuHUD.toast(.success("Save successful"))
                            qzaliNavi.pop()
                        }.padding(.bottom, 40)
                }
                
            }
        }.onTapGesture {
            qawayIsFocus = false
        }.photosPicker(
            isPresented: $tjriwncAJShowAvatarPicker,
            selection: $selectedItem,
            matching: .images
        )
        .onChange(of: selectedItem) { item in
            guard let item else { return }
            
            Task {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    
                    // 1️⃣ 保存到本地
                    if let localPath = XigoLocalImageManager.saveXigoImage(image) {
                        qawyXmaUserAvatar = localPath   // ✅ 赋值给头像
                    }
                }
            }
        }
        .navigationBarHidden(true)
            .background(EnableSwipeBack())
            .onAppear{
                if let qamdMine = qaawnzUserVm.currentUser {
                    qawyXmaUserAvatar = qamdMine.xawuxLAiwMAvatar
                    qawayText = qamdMine.xawuxLAiwMUserName
                }
                
            }
    }
}
