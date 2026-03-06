import SwiftUI

struct OAjdsaCneScreenShape: Shape {
    
    var cornerRadius: CGFloat = 40
    var notchWidth: CGFloat = 220
    var notchDepth: CGFloat = 40
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        
        let notchStartX = (width - notchWidth) / 2
        let notchEndX = notchStartX + notchWidth
        
        // 从左上角开始
        path.move(to: CGPoint(x: cornerRadius, y: 0))
        
        // 左上圆角
        path.addQuadCurve(
            to: CGPoint(x: 0, y: cornerRadius),
            control: CGPoint(x: 0, y: 0)
        )
        
        // 左边
        path.addLine(to: CGPoint(x: 0, y: height - cornerRadius))
        
        // 左下圆角
        path.addQuadCurve(
            to: CGPoint(x: cornerRadius, y: height),
            control: CGPoint(x: 0, y: height)
        )
        
        // 底边
        path.addLine(to: CGPoint(x: width - cornerRadius, y: height))
        
        // 右下圆角
        path.addQuadCurve(
            to: CGPoint(x: width, y: height - cornerRadius),
            control: CGPoint(x: width, y: height)
        )
        
        // 右边
        path.addLine(to: CGPoint(x: width, y: cornerRadius))
        
        // 右上圆角
        path.addQuadCurve(
            to: CGPoint(x: width - cornerRadius, y: 0),
            control: CGPoint(x: width, y: 0)
        )
        
        // 到刘海右侧
        path.addLine(to: CGPoint(x: notchEndX, y: 0))
        
        path.addLine(to: CGPoint(x: (width / 2) + 10, y: notchDepth - 4))
        
        path.addQuadCurve(
            to: CGPoint(x: (width / 2) - 10, y: notchDepth - 4),
            control: CGPoint(x: width / 2, y: notchDepth)
        )

        path.addLine(to: CGPoint(x: notchStartX, y: 0))
        
        
        
        path.closeSubpath()
        
        return path
    }
}
