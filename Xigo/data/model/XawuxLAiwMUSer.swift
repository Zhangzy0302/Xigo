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
  var xawuxLAiwMLikeVideos: [Int]
    var xawuxLAiwMLikePosts: [Int]
  var xawuxLAiwMIsDeleted: Bool

  // MARK: - Identifiable
  var id: Int { xawuxLAiwMUserId }
}

@MainActor
final class XawuxLAiwMUSerViewModel: ObservableObject {

  @Published var users: [XawuxLAiwMUSer] = []
  @Published var currentUser: XawuxLAiwMUSer?
  @Published var userInfo: XawuxLAiwMUSer?
    @Published var currentUserID: Int = 7700

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
      currentUserID = uid
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
      currentUserID = matchUser.xawuxLAiwMUserId
    loadLoginXawuxLAiwMUser()
    return matchUser
  }

  // 游客登录
  func visitorLoginXawuxLAiwM() {
    storage.setCurrentUserId(8)
      currentUserID = 8
    loadLoginXawuxLAiwMUser()
  }

  // 删除账号
  func deleteAccountXawuxLAiwM() {
    if storage.getCurrentUserId() == 8 {
      storage.updateUser(uid: 8) { user in
        var newUser: XawuxLAiwMUSer = user
        newUser.xawuxLAiwMUserName = "Visitor_00" + "\(Int.random(in: 20...100))"
        newUser.xawuxLAiwMAvatar = "cukan_default"
        newUser.xawuxLAiwMFollowing = []
        newUser.xawuxLAiwMFans = []
        newUser.xawuxLAiwMBlacklist = []
        newUser.xawuxLAiwMWalletBalance = 0
        newUser.xawuxLAiwMLikeVideos = []
          newUser.xawuxLAiwMLikePosts = []
        newUser.xawuxLAiwMIsDeleted = false
        return newUser
      }
    } else {
      toggleUserIsDeleted()
    }

    storage.setCurrentUserId(7700)
      currentUserID = 7700
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
      xawuxLAiwMLikeVideos: [],
      xawuxLAiwMLikePosts: [],
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

  // 切换是否喜欢视频作品
  func toggleVideoIsLiked(_ videoId: Int) {
    storage.updateUser(uid: currentUser!.xawuxLAiwMUserId) { user in
      var newUser: XawuxLAiwMUSer = user
      if newUser.xawuxLAiwMLikeVideos.contains(videoId) {
        newUser.xawuxLAiwMLikeVideos.removeAll { $0 == videoId }
          storage.decreaseLikeCount(workId: videoId)
      } else {
        newUser.xawuxLAiwMLikeVideos.append(videoId)
          storage.increaseLikeCount(workId: videoId)
      }
      return newUser
    }
    loadLoginXawuxLAiwMUser()
  }
    
    // 切换是否喜欢图片作品
    func toggleCosPostsIsLiked(_ postID: Int) {
      storage.updateUser(uid: currentUser!.xawuxLAiwMUserId) { user in
        var newUser: XawuxLAiwMUSer = user
        if newUser.xawuxLAiwMLikePosts.contains(postID) {
          newUser.xawuxLAiwMLikePosts.removeAll { $0 == postID }
            storage.decreaseCosplayPostLikeCount(postId: postID)
        } else {
          newUser.xawuxLAiwMLikePosts.append(postID)
            storage.increaseCosplayPostLikeCount(postId: postID)
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
