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
