import SwiftUI
import PhotosUI

struct CzlsiwPostVideo: View {
    let cznlisPostIsVideo: Bool
    @State private var cznajLsText: String = ""
    @FocusState private var cznajIsFocus: Bool
    
    
    @State private var asuwaVideoPath: String = ""
    @State private var asuwaVideoCover: String = ""
    
    @State private var axanaljmxImageList: [String] = []
    
    @EnvironmentObject var czlisiwVideoVM: ErwyAuwVideoViewModel
    @EnvironmentObject var czlisiwPostVM: WUiqbahCosPostsViewModel
    @EnvironmentObject var cznliswNAviMA: UxzuaNaaviManer
    
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
            VStack{
                IEyabZHskTopBar()
                GeometryReader{ geo in
                    ZStack(alignment: .top){
                        OAjdsaCneScreenShape(notchDepth: 30)
                            .fill(
                                LinearGradient(
                                    colors: [
                                        Color.white,
                                        Color(red: 1.0, green: 0.92, blue: 0.96)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .shadow(color: .blue.opacity(0.1), radius: 4, y: -4)
                            .overlay{
                                VStack(alignment: .leading){
                                    Text("Detail:")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                                        .foregroundColor(.black)
                                    
                                    TextField("", text: $cznajLsText, prompt: Text("Say something...")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                        .foregroundColor(.black.opacity(0.5)))
                                        .focused($cznajIsFocus)
                                        .tint(.black)
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                                        .foregroundColor(.black)
                                        .autocorrectionDisabled(false)
                                        .frame(height: 120, alignment: .top)
                                        .onTapGesture {
                                            cznajIsFocus = true
                                        }
                                    Spacer()
                                    Text(cznlisPostIsVideo ? "Video" : "Picture")
                                        .font(XigexcTheme.XigoFont.xiabalMainFont(18))
                                        .foregroundColor(.black)
                                        .padding(.horizontal, 10)
                                        .padding(.vertical, 5)
                                        .background(RoundedRectangle(cornerRadius: 10).fill(XigexcTheme.XigoColor.xiabalMainPurple.opacity(0.4)))
                                        .padding(.bottom, 16)
                                    if cznlisPostIsVideo {
                                        CzlsiwaVideoPicker(asuwaVideoPath: $asuwaVideoPath, asuwaVideoCover: $asuwaVideoCover)
                                    }else {
                                        CanzliImagePicker(cznailwImageList: $axanaljmxImageList)
                                    }
                                }.padding(.horizontal, 20)
                                    .padding(.top, 40)
                                    .padding(.bottom, 20)
                            }
                        RoundedRectangle(cornerRadius: 3)
                            .fill(Color.white)
                            .frame(width: 35.5, height: 1)
                            .shadow(color: .black.opacity(0.25), radius: 4)
                    }
                    
                }.cornerRadius(20).padding(.horizontal, 20)
                
                Text("Publish")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .semiBold))
                    .foregroundColor(.white)
                    .frame(width: 144, height: 47)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.black)
                    ).onTapGesture {
                        if cznajLsText.isEmpty {
                            DwhaiXeuHUD.toast(.normal("Detail is required"))
                            return
                        }
                        if cznlisPostIsVideo {
                            if (asuwaVideoPath.isEmpty || asuwaVideoCover.isEmpty) {
                                DwhaiXeuHUD.toast(.normal("Please upload a video"))
                                return
                            }
                            let newiawID = czlisiwVideoVM.addNewErwyAuwWork(textContent: cznajLsText, videoUrl: asuwaVideoPath, videoCover: asuwaVideoCover)
                            Task {
                                DwhaiXeuHUD.showLoading()
                                await delay(0.6)
                                DwhaiXeuHUD.hideLoading()
                                cznliswNAviMA.pop()
                                cznliswNAviMA.push(.uWxnazaAkalVideoDetail(uWanaiVideoID: newiawID))
                                DwhaiXeuHUD.toast(.success("Published successfully"))
                            }
                            
                        } else {
                            if axanaljmxImageList.isEmpty {
                                DwhaiXeuHUD.toast(.normal("Please upload 1 to 3 images"))
                                return
                            }
                            Task {
                                let newixnwPostID = czlisiwPostVM.addMyPosts(cznajLsText, imageList: axanaljmxImageList)
                                DwhaiXeuHUD.showLoading()
                                await delay(0.6)
                                DwhaiXeuHUD.hideLoading()
                                cznliswNAviMA.pop()
                                cznliswNAviMA.push(.fhweyaOueCosDetail(fhwuPostId: newixnwPostID))
                                DwhaiXeuHUD.toast(.success("Published successfully"))
                            }
                            
                        }
                    }.padding(.vertical, 30)
            }
        }.onTapGesture {
            cznajIsFocus = false
        }
        .navigationBarHidden(true)
            .background(EnableSwipeBack())
            .ignoresSafeArea(.keyboard)
    }
    
    struct CzlsiwaVideoPicker: View {
        @State private var czlsiwaSelectedVideoItem: PhotosPickerItem?
        @Binding var asuwaVideoPath: String
        @Binding var asuwaVideoCover: String
        
        func czlsiwaCopyVideoToLocal(url: URL) -> URL {
            let xiwalkxFileName = "video_\(Int(Date().timeIntervalSince1970)).mp4"
            let xiwalkxDoc = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let targetURL = xiwalkxDoc.appendingPathComponent(xiwalkxFileName)

            if FileManager.default.fileExists(atPath: targetURL.path) {
                try? FileManager.default.removeItem(at: targetURL)
            }

            try? FileManager.default.copyItem(at: url, to: targetURL)
            return targetURL
        }
        
        func czlsiwaHandlePickedVideo(_ item: PhotosPickerItem) async {

            await MainActor.run {
                DwhaiXeuHUD.showLoading()
            }

            defer {
                Task { @MainActor in
                    DwhaiXeuHUD.hideLoading()
                }
            }

            guard let chekalkjData = try? await item.loadTransferable(type: Data.self) else {
                return
            }

            let xiwalkxFileName = "video_\(Int(Date().timeIntervalSince1970)).mp4"
            let xiwalkxDoc = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let xiwalkxLocalURL = xiwalkxDoc.appendingPathComponent(xiwalkxFileName)

            do {
                try chekalkjData.write(to: xiwalkxLocalURL)
            } catch {
                return
            }

            if let xowuAkjxaCover = xowuAkjxaGenerVideoCover(url: xiwalkxLocalURL),
               let xowuAkjxaCoverPath = saveImageAInxlaw(xowuAkjxaCover) {

                await MainActor.run {
                    asuwaVideoPath = xiwalkxLocalURL.path
                    asuwaVideoCover = xowuAkjxaCoverPath
                }

            }
        }
        
        func xowuAkjxaGenerVideoCover(url: URL) -> UIImage? {
            let asset = AVAsset(url: url)
            let generator = AVAssetImageGenerator(asset: asset)
            generator.appliesPreferredTrackTransform = true

            let time = CMTime(seconds: 0.1, preferredTimescale: 600)

            do {
                let cgImage = try generator.copyCGImage(at: time, actualTime: nil)
                return UIImage(cgImage: cgImage)
            } catch {
                print("❌ 封面截取失败：\(error)")
                return nil
            }
        }
        
        func saveImageAInxlaw(_ image: UIImage) -> String? {
            guard let chekalkjData = image.jpegData(compressionQuality: 0.8) else { return nil }

            let name = "video_cover_\(Int(Date().timeIntervalSince1970)).jpg"
            let xiwalkxDoc = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
            let url = xiwalkxDoc.appendingPathComponent(name)

            try? chekalkjData.write(to: url)
            return url.path
        }
        var body: some View {
            if !asuwaVideoPath.isEmpty && !asuwaVideoCover.isEmpty {
                ZStack(alignment: .topTrailing){
                    SkahwuLwXImage(SkahwuLwXImageUrl: asuwaVideoCover, SkahwuLwXWidth: 109, SkahwuLwXHeight: 147).cornerRadius(20)
                    Circle()
                      .fill(.black)
                      .frame(width: 24, height: 24)
                      .overlay {
                        Image(systemName: "minus")
                              .font(.system(size: 20))
                              .foregroundStyle(.white)
                      }
                      .padding(4)
                      .onTapGesture {
                        asuwaVideoPath = ""
                          asuwaVideoCover = ""
                      }
                }
            }else {
                PhotosPicker(
                    selection: $czlsiwaSelectedVideoItem,
                        matching: .videos
                ) {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.black)
                        .frame(width: 109, height: 147)
                        .overlay{
                            Image(systemName: "plus")
                                .font(.system(size: 20))
                                .foregroundStyle(.white)
                        }
                }.onChange(of: czlsiwaSelectedVideoItem) { item in
                    guard let item else { return }

                    Task {
                        await czlsiwaHandlePickedVideo(item)
                    }
                }
            }
           
        }
    }
    
    struct CanzliImagePicker: View {
        @Binding var cznailwImageList: [String]
        @State private var runUDwalsjImagePickerItem: [PhotosPickerItem] = []  // 多选
        @State private var tjriwncAJShowAvatarPicker: Bool = false
        let cuanzGridColumus = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
        
        var body: some View {
            LazyVGrid(columns: cuanzGridColumus) {
                ForEach(cznailwImageList.indices, id: \.self) { imageIndex in
                    Group {
                        ZStack(alignment: .topTrailing){
                            SkahwuLwXImage(SkahwuLwXImageUrl: cznailwImageList[imageIndex], SkahwuLwXWidth: 109, SkahwuLwXHeight: 147).cornerRadius(20)
                            Circle()
                              .fill(.black)
                              .frame(width: 24, height: 24)
                              .overlay {
                                  Image(systemName: "minus")
                                        .font(.system(size: 20))
                                        .foregroundStyle(.white)
                              }
                              .padding(4)
                              .onTapGesture {
                                cznailwImageList.removeAll { $0 == cznailwImageList[imageIndex] }
                              }
                        }
                    }
                }
                if cznailwImageList.count < 3 {
                    PhotosPicker(
                        selection: $runUDwalsjImagePickerItem,
                        maxSelectionCount: 3 - cznailwImageList.count,
                        matching: .images,
                        
                    ) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.black)
                            .frame(width: 109, height: 147)
                            .overlay{
                                Image(systemName: "plus")
                                    .font(.system(size: 20))
                                    .foregroundColor(.white)
                            }
                    }.onChange(of: runUDwalsjImagePickerItem) { items in
                        Task {
                          var newPaths: [String] = []

                          for item: PhotosPickerItem in items {
                            if let chekalkjData = try? await item.loadTransferable(type: Data.self),
                              let image = UIImage(data: chekalkjData),
                              let localPath = XigoLocalImageManager.saveXigoImage(image)
                            {
                              newPaths.append(localPath)
                            }
                          }

                          let remainCount = max(0, 3 - cznailwImageList.count)
                          let finalPaths = Array(newPaths.prefix(remainCount))

                            cznailwImageList.append(contentsOf: finalPaths)
                          runUDwalsjImagePickerItem.removeAll()
                        }
                    }
                }
                
            }
        }
    }
}
