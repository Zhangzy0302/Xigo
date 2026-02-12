import SwiftUI

enum UxzuaAppRoute: Hashable {
    case weytqxzSignPage
}

struct UxzuaXigoRouterStack: View {
    @EnvironmentObject private var uxaiznNaviManner: UxzuaNaaviManer
    
    var body: some View {
        NavigationStack(path: $uxaiznNaviManner.uzszuPath) {
            TrwyquGuidePage()
        }.navigationDestination(for: UxzuaAppRoute.self) { route in
            switch route {
            case .weytqxzSignPage:
                WeytqxzSignPage()
            }
        }
        .onAppear{
            for family in UIFont.familyNames {
                print("Family:", family)
                for name in UIFont.fontNames(forFamilyName: family) {
                    print("   Font:", name)
                }
            }
        }
    }
}

class UxzuaNaaviManer: ObservableObject {
    // 核心：全局共享的导航路径
    @Published var uzszuPath: NavigationPath = NavigationPath()
    
    // 便捷方法：跳转到指定路由
    func push(_ route: UxzuaAppRoute) {
        uzszuPath.append(route)
    }
    
    // 便捷方法：返回上一页
    func pop() {
        uzszuPath.removeLast()
    }
    
    // 便捷方法：返回根页面
    func popToRoot() {
        uzszuPath.removeLast(uzszuPath.count)
    }

}
