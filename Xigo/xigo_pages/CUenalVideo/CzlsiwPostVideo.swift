import PhotosUI
import SwiftUI

struct CzlsiwPostVideo: View {
  let cznlisPostIsVideo: Bool
  @State private var cznajLsText: String = ""
  @FocusState private var cznajIsFocus: Bool

  @State private var fgjrqwAKJhwVideoPath: String = ""
  @State private var fgjrqwAKJhwVideoCover: String = ""

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
      VStack {
        IEyabZHskTopBar()
        GeometryReader { geo in
          ZStack(alignment: .top) {
            OAjdsaCneScreenShape(notchDepth: 30)
              .fill(
                LinearGradient(
                  colors: [
                    Color.white,
                    Color(red: 1.0, green: 0.92, blue: 0.96),
                  ],
                  startPoint: .top,
                  endPoint: .bottom
                )
              )
              .shadow(color: .blue.opacity(0.1), radius: 4, y: -4)
              .overlay {
                VStack(alignment: .leading) {
                  Text("Detail:")
                    .font(XigexcTheme.XigoFont.xiabalMainFont(20, weight: .black))
                    .foregroundColor(.black)

                  TextField(
                    "", text: $cznajLsText,
                    prompt: Text("Say something...")
                      .font(XigexcTheme.XigoFont.xiabalMainFont(16))
                      .foregroundColor(.black.opacity(0.5))
                  )
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
                    .background(
                      RoundedRectangle(cornerRadius: 10).fill(
                        XigexcTheme.XigoColor.xiabalMainPurple.opacity(0.4))
                    )
                    .padding(.bottom, 16)
                  if cznlisPostIsVideo {
                    CzlsiwaVideoPicker(
                      fgjrqwAKJhwVideoPath: $fgjrqwAKJhwVideoPath,
                      fgjrqwAKJhwVideoCover: $fgjrqwAKJhwVideoCover)
                  } else {
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
              if fgjrqwAKJhwVideoPath.isEmpty || fgjrqwAKJhwVideoCover.isEmpty {
                DwhaiXeuHUD.toast(.normal("Please upload a video"))
                return
              }
              let newiawID = czlisiwVideoVM.addNewErwyAuwWork(
                textContent: cznajLsText, videoUrl: fgjrqwAKJhwVideoPath,
                videoCover: fgjrqwAKJhwVideoCover)
              Task {
                DwhaiXeuHUD.showLoading()
                await xiwandelay(0.6)
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
                let newixnwPostID = czlisiwPostVM.addMyPosts(
                  cznajLsText, imageList: axanaljmxImageList)
                DwhaiXeuHUD.showLoading()
                await xiwandelay(0.6)
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
    .background(XiwanEnableSwipeBack())
    .ignoresSafeArea(.keyboard)
  }

  struct CzlsiwaVideoPicker: View {
    @State private var czlsiwaSelectedVideoItem: PhotosPickerItem?
    @Binding var fgjrqwAKJhwVideoPath: String
    @Binding var fgjrqwAKJhwVideoCover: String

    func czlsiwaCopyVideoToLocal(url: URL) -> URL {
      let xiwalkxFileName = "video_\(Int(Date().timeIntervalSince1970)).mp4"
      let xiwalkxDoc = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
      let xiwalkxTartURL = xiwalkxDoc.appendingPathComponent(xiwalkxFileName)

      if FileManager.default.fileExists(atPath: xiwalkxTartURL.path) {
        try? FileManager.default.removeItem(at: xiwalkxTartURL)
      }

      try? FileManager.default.copyItem(at: url, to: xiwalkxTartURL)
      return xiwalkxTartURL
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
        let xowuAkjxaCoverPath = saveImageAInxlaw(xowuAkjxaCover)
      {

        await MainActor.run {
          fgjrqwAKJhwVideoPath = xiwalkxLocalURL.path
          fgjrqwAKJhwVideoCover = xowuAkjxaCoverPath
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

    func saveImageAInxlaw(_ xiwalkxImage: UIImage) -> String? {
      guard let chekalkjData = xiwalkxImage.jpegData(compressionQuality: 0.8) else { return nil }

      let name = "video_cover_\(Int(Date().timeIntervalSince1970)).jpg"
      let xiwalkxDoc = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
      let url = xiwalkxDoc.appendingPathComponent(name)

      try? chekalkjData.write(to: url)
      return url.path
    }
    var body: some View {
      if !fgjrqwAKJhwVideoPath.isEmpty && !fgjrqwAKJhwVideoCover.isEmpty {
        ZStack(alignment: .topTrailing) {
          SkahwuLwXImage(
            SkahwuLwXImageUrl: fgjrqwAKJhwVideoCover, SkahwuLwXWidth: 109, SkahwuLwXHeight: 147
          ).cornerRadius(20)
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
              fgjrqwAKJhwVideoPath = ""
              fgjrqwAKJhwVideoCover = ""
            }
        }
      } else {
        PhotosPicker(
          selection: $czlsiwaSelectedVideoItem,
          matching: .videos
        ) {
          RoundedRectangle(cornerRadius: 20)
            .fill(.black)
            .frame(width: 109, height: 147)
            .overlay {
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
            ZStack(alignment: .topTrailing) {
              SkahwuLwXImage(
                SkahwuLwXImageUrl: cznailwImageList[imageIndex], SkahwuLwXWidth: 109,
                SkahwuLwXHeight: 147
              ).cornerRadius(20)
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
              .overlay {
                Image(systemName: "plus")
                  .font(.system(size: 20))
                  .foregroundColor(.white)
              }
          }.onChange(of: runUDwalsjImagePickerItem) { items in
            Task {
              var newPaths: [String] = []

              for item: PhotosPickerItem in items {
                if let chekalkjData = try? await item.loadTransferable(type: Data.self),
                  let xiwalkxImage = UIImage(data: chekalkjData),
                  let localPath = XigoLocalImageManager.saveXigoImage(xiwalkxImage)
                {
                  newPaths.append(localPath)
                }
              }

              let xiwalkxRemainCount = max(0, 3 - cznailwImageList.count)
              let xiwalkxFinalPaths = Array(newPaths.prefix(xiwalkxRemainCount))

              cznailwImageList.append(contentsOf: xiwalkxFinalPaths)
              runUDwalsjImagePickerItem.removeAll()
            }
          }
        }

      }
    }
  }
}
