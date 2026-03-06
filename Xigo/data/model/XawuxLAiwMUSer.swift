import SwiftUI

struct XawuxLAiwMUSer: Codable, Identifiable, Equatable {

  let xawuxLAiwMUserId: Int
  var xawuxLAiwMEmail: String
  var xawuxLAiwMPassword: String
  var xawuxLAiwMUserName: String
  var xawuxLAiwMAvatar: String
  var xawuxLAiwMFollowing: [Int]
  var xawuxLAiwMFans: [Int]
  var xawuxLAiwMBlacklist: [Int]
  var xawuxLAiwMWalletBalance: Int
  var xawuxLAiwMLikeWorks: [Int]
  var xawuxLAiwMIsDeleted: Bool

  // MARK: - Identifiable
  var id: Int { xawuxLAiwMUserId }
}

@MainActor
final class XawuxLAiwMUSerViewModel: ObservableObject {

  @Published var users: [XawuxLAiwMUSer] = []
  @Published var currentUser: XawuxLAiwMUSer?
  @Published var userInfo: XawuxLAiwMUSer?

  private let storage = XigoAuwStorageManager.shared

  func getXawuxLAiwMUserInfoByUid(uid: Int) {
    userInfo = storage.getUserById(userId: uid)
  }

  func returnXawuxLAiwMUserInfoById(userId: Int) -> XawuxLAiwMUSer? {
    storage.getUserById(userId: userId)
  }

  func loadLoginXawuxLAiwMUser() {
    users = storage.getUsers()

    let uid: Int = storage.getCurrentUserId()
    currentUser = users.first { $0.xawuxLAiwMUserId == uid }
  }

  // 登录
  func loginByEmailAndPasswordXawuxLAiwM(email: String, password: String) -> XawuxLAiwMUSer? {
    let users = storage.getUsers()
    guard
      let matchUser = users.first(where: {
        $0.xawuxLAiwMEmail == email && $0.xawuxLAiwMPassword == password && !$0.xawuxLAiwMIsDeleted
      })
    else {
      return nil
    }

    // 记录登录态
    storage.setCurrentUserId(matchUser.xawuxLAiwMUserId)
    loadLoginXawuxLAiwMUser()
    return matchUser
  }

  // 游客登录
  func visitorLoginXawuxLAiwM() {
    storage.setCurrentUserId(6)
    loadLoginXawuxLAiwMUser()
  }

  // 删除账号
  func deleteAccountXawuxLAiwM() {
    if storage.getCurrentUserId() == 6 {
      storage.updateUser(uid: 6) { user in
        var newUser: XawuxLAiwMUSer = user
        newUser.xawuxLAiwMUserName = "Visitor_00" + "\(Int.random(in: 20...100))"
        newUser.xawuxLAiwMAvatar = "cponlzna_default_avatar"
        newUser.xawuxLAiwMFollowing = []
        newUser.xawuxLAiwMFans = []
        newUser.xawuxLAiwMBlacklist = []
        newUser.xawuxLAiwMWalletBalance = 0
        newUser.xawuxLAiwMLikeWorks = []
        newUser.xawuxLAiwMIsDeleted = false
        return newUser
      }
    } else {
      toggleUserIsDeleted()
    }

    storage.setCurrentUserId(7700)
    loadLoginXawuxLAiwMUser()
  }

  // 注册
  func registerXawuxLAiwM(email: String, password: String) -> XawuxLAiwMUSer? {
    let users = storage.getUsers()
    guard
      users.first(where: { $0.xawuxLAiwMEmail == email }) == nil
    else {
      return nil
    }

    let newUser: XawuxLAiwMUSer = XawuxLAiwMUSer(
      xawuxLAiwMUserId: users.count,
      xawuxLAiwMEmail: email,
      xawuxLAiwMPassword: password,
      xawuxLAiwMUserName: "User_" + String(users.count),
      xawuxLAiwMAvatar: "cponlzna_default_avatar",
      xawuxLAiwMFollowing: [],
      xawuxLAiwMFans: [],
      xawuxLAiwMBlacklist: [],
      xawuxLAiwMWalletBalance: 0,
      xawuxLAiwMLikeWorks: [],
      xawuxLAiwMIsDeleted: false
    )

    storage.addUser(user: newUser)
    storage.setCurrentUserId(newUser.xawuxLAiwMUserId)
    loadLoginXawuxLAiwMUser()
    return newUser
  }

  // 登出
  func logoutXawuxLAiwM() {
    storage.setCurrentUserId(7700)
    loadLoginXawuxLAiwMUser()
  }

  // 切换用户状态
  func toggleUserIsDeleted() {
    storage.updateUser(uid: currentUser!.xawuxLAiwMUserId) { user in
      var newUser: XawuxLAiwMUSer = user
      newUser.xawuxLAiwMIsDeleted = !newUser.xawuxLAiwMIsDeleted
      return newUser
    }

    loadLoginXawuxLAiwMUser()
  }

  // 切换拉黑状态
  func toggleUserIsBlocked(blockUserId: Int) {
    storage.updateUser(uid: currentUser!.xawuxLAiwMUserId) { user in
      var newUser: XawuxLAiwMUSer = user
      if newUser.xawuxLAiwMBlacklist.contains(blockUserId) {
        newUser.xawuxLAiwMBlacklist.removeAll { $0 == blockUserId }
      } else {
        newUser.xawuxLAiwMBlacklist.append(blockUserId)
      }

      return newUser
    }

    loadLoginXawuxLAiwMUser()
  }

  // 切换是否喜欢作品
  func toggleWorkIsLiked(workId: Int) {
    storage.updateUser(uid: currentUser!.xawuxLAiwMUserId) { user in
      var newUser: XawuxLAiwMUSer = user
      if newUser.xawuxLAiwMLikeWorks.contains(workId) {
        newUser.xawuxLAiwMLikeWorks.removeAll { $0 == workId }
      } else {
        newUser.xawuxLAiwMLikeWorks.append(workId)
      }
      return newUser
    }
    loadLoginXawuxLAiwMUser()
  }

  // 切换关注状态
  func toggleXawuxLAiwMUserIsFollowed(followUserId: Int) {
    guard let currentUser = currentUser else { return }

    // 1️⃣ 更新当前用户
    storage.updateUser(uid: currentUser.xawuxLAiwMUserId) { user in
      var newUser = user

      if newUser.xawuxLAiwMFollowing.contains(followUserId) {
        newUser.xawuxLAiwMFollowing.removeAll { $0 == followUserId }
      } else {
        newUser.xawuxLAiwMFollowing.append(followUserId)
      }

      return newUser
    }

    // 2️⃣ 更新被关注用户
    storage.updateUser(uid: followUserId) { user in
      var newFollowUser = user

      if newFollowUser.xawuxLAiwMFans.contains(currentUser.xawuxLAiwMUserId) {
        newFollowUser.xawuxLAiwMFans.removeAll { $0 == currentUser.xawuxLAiwMUserId }
      } else {
        newFollowUser.xawuxLAiwMFans.append(currentUser.xawuxLAiwMUserId)
      }

      return newFollowUser
    }

    loadLoginXawuxLAiwMUser()
  }

  // 修改用户信息
  func editXawuxLAiwMUserInfo(name: String, avatar: String) {
    storage.updateUser(uid: currentUser!.xawuxLAiwMUserId) { user in
      var newUser: XawuxLAiwMUSer = user
      newUser.xawuxLAiwMUserName = name
      newUser.xawuxLAiwMAvatar = avatar
      return newUser
    }

    loadLoginXawuxLAiwMUser()
  }

  // 更新用户钻石数
  func increaseUserDiamond(diamond: Int) {
    storage.updateUser(uid: currentUser!.xawuxLAiwMUserId) { user in
      var newUser: XawuxLAiwMUSer = user
      newUser.xawuxLAiwMWalletBalance = newUser.xawuxLAiwMWalletBalance + diamond
      return newUser
    }

    loadLoginXawuxLAiwMUser()
  }
}
