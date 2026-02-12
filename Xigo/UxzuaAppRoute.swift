import SwiftUI

enum UxzuaAppRoute: Hashable {
    
}

struct UxzuaXigoRouterStack: View {
    var body: some View {
        NavigationStack() {
            TrwyquGuidePage()
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
