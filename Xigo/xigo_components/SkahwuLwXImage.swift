import SwiftUI

struct SkahwuLwXImage: View {

  let SkahwuLwXImageUrl: String
  let SkahwuLwXWidth: CGFloat?
  let SkahwuLwXHeight: CGFloat?
  let SkahwuLwXIsCircle: Bool
    let SkahwuLwXCircleColor: Color?
    let SkahwuLwXCircleWidth: CGFloat?
  let SkahwuLwXContentMode: ContentMode

  init(
    SkahwuLwXImageUrl: String,
    SkahwuLwXWidth: CGFloat? = nil,
    SkahwuLwXHeight: CGFloat? = nil,
    SkahwuLwXIsCircle: Bool = false,
    SkahwuLwXCircleColor: Color? = nil,
    SkahwuLwXCircleWidth: CGFloat? = nil,
    SkahwuLwXContentMode: ContentMode = .fill
  ) {
    self.SkahwuLwXImageUrl = SkahwuLwXImageUrl
    self.SkahwuLwXWidth = SkahwuLwXWidth
    self.SkahwuLwXHeight = SkahwuLwXHeight
    self.SkahwuLwXIsCircle = SkahwuLwXIsCircle
      self.SkahwuLwXCircleColor = SkahwuLwXCircleColor
      self.SkahwuLwXCircleWidth = SkahwuLwXCircleWidth
    self.SkahwuLwXContentMode = SkahwuLwXContentMode
      
  }

  var body: some View {
    let imageView = buildImage()
      .frame(width: SkahwuLwXWidth, height: SkahwuLwXHeight)
      .clipped()

    if SkahwuLwXIsCircle {
      imageView
        .clipShape(Circle())
        .overlay {
            if SkahwuLwXCircleColor == nil {
                Circle().stroke(XigexcTheme.XigoColor.xiabalPinkPurpleGradient, lineWidth: 1)
            }else {
                Circle().stroke(SkahwuLwXCircleColor!, lineWidth: 1)
            }
            
        }
    } else {
      imageView
    }
  }
}

// MARK: - Build Image
extension SkahwuLwXImage {

  fileprivate func isLocalFilePath(_ path: String) -> Bool {
    path.hasPrefix("/")
  }

  fileprivate func isNetworkUrl(_ path: String) -> Bool {
    path.hasPrefix("http://") || path.hasPrefix("https://")
  }

  @ViewBuilder
  fileprivate func buildImage() -> some View {

    // 1️⃣ 空
    if SkahwuLwXImageUrl.isEmpty {
      placeholderView()
    }

    // 2️⃣ 网络图片
    else if isNetworkUrl(SkahwuLwXImageUrl),
            let url = URL(string: SkahwuLwXImageUrl) {

      AsyncImage(url: url) { phase in
        switch phase {
        case .empty:
          placeholderView()
        case .success(let image):
          image
            .resizable()
            .aspectRatio(contentMode: SkahwuLwXContentMode)
        case .failure:
          placeholderView()
        @unknown default:
          placeholderView()
        }
          
          
      }

    }

    // 3️⃣ 本地文件
    else if isLocalFilePath(SkahwuLwXImageUrl),
            let uiImage = UIImage(contentsOfFile: SkahwuLwXImageUrl) {

      Image(uiImage: uiImage)
        .resizable()
        .aspectRatio(contentMode: SkahwuLwXContentMode)

    }

    // 4️⃣ Asset
    else {

      Image(SkahwuLwXImageUrl)
        .resizable()
        .aspectRatio(contentMode: SkahwuLwXContentMode)

    }
  }

  fileprivate func placeholderView() -> some View {
    ZStack {
      Color(.systemGray5)
      Image(systemName: "photo")
        .foregroundColor(.gray)
    }
  }
}
