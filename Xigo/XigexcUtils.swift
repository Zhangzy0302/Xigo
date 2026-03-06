import SwiftUI

enum XigexcTheme {
    enum XigoColor {
        static let xiabalMainPink = SwiftUI.Color(red: 1, green: 36 / 255, blue: 156 / 255)
        static let xiabalMainPurple = SwiftUI.Color(red: 108 / 255, green: 36 / 255, blue: 242 / 255)
        static let xiabalPinkPurpleGradient = LinearGradient(colors: [
            xiabalMainPink,
            xiabalMainPurple
        ], startPoint: .leading, endPoint: .trailing)
    }

    enum XigoFont {

            enum Weight {
                case regular
                case medium
                case semiBold
                case bold
                case extraBold
                case black
            }

            static func xiabalMainFont(
                _ size: CGFloat,
                weight: Weight = .regular
            ) -> Font {

                let fontName: String

                switch weight {
                case .regular:
                    fontName = "PlayfairDisplay-Regular"
                case .medium:
                    fontName = "PlayfairDisplay-Medium"
                case .semiBold:
                    fontName = "PlayfairDisplay-SemiBold"
                case .bold:
                    fontName = "PlayfairDisplay-Bold"
                case .extraBold:
                    fontName = "PlayfairDisplay-ExtraBold"
                case .black:
                    fontName = "PlayfairDisplay-Black"
                }

                return .custom(fontName, size: size)
            }
        }
}

enum LocalImageManager {
  static func saveImage(_ image: UIImage) -> String? {
    let fileName = UUID().uuidString + ".jpg"
    let data = image.jpegData(compressionQuality: 0.9)

    guard let data else { return nil }

    let documentsURL = FileManager.default.urls(
      for: .documentDirectory,
      in: .userDomainMask
    ).first!

    let fileURL = documentsURL.appendingPathComponent(fileName)

    do {
      try data.write(to: fileURL)
      return fileURL.path  // ✅ 返回 String，正好给 ieujanMyAvatar 用
    } catch {
      print("Save image error:", error)
      return nil
    }
  }
}

struct XigOUWnalAHlkskDialog<Dialog: View>: View {
    @Binding var xigousIsShow: Bool
    @ViewBuilder let ouxnaDialog: () -> Dialog
    
    var body: some View {
        ZStack{
            if xigousIsShow {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                    .onTapGesture {
                        xigousIsShow = false
                    }
                ouxnaDialog()
            }
            
        }.animation(.easeInOut(duration: 0.2), value: xigousIsShow)
        
        
    }
}
