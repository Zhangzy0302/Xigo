import Foundation
import SwiftUI

final class XigoAuwStorageManager {

  static let shared = XigoAuwStorageManager()
  private init() {}

  private let storage = UserDefaults.standard

  // MARK: - Keys
  private enum Keys {
    static let xawuxLAiwMUsers: String = "xawuxLAiwMUsers"
    static let erwyAuwWorks: String = "erwyAuwWorks"
    static let manuwqoAiComments: String = "manuwqoAiComments"
    static let sswzuLwoqxChatRooms: String = "sswzuLwoqxChatRooms"
    static let sswzuLwoqxMessages: String = "sswzuLwoqxMessages"
    static let cosplayPosts: String = "cosplayPosts"
    static let xigoAuwCurrentUserId: String = "xigoAuwCurrentUserId"
  }
}

extension XigoAuwStorageManager {

  func initializeAllDefaults() {
    initializeUsersIfNeeded()
    initializeWorksIfNeeded()
    initializeCommentsIfNeeded()
    initializeChatRoomsIfNeeded()
    initializeMessagesIfNeeded()
    initializeCosplayPostsIfNeeded()
  }

}

//User CRUD & 登录态
extension XigoAuwStorageManager {

  private func initializeUsersIfNeeded() {
    guard storage.data(forKey: Keys.xawuxLAiwMUsers) == nil else { return }

    let users: [XawuxLAiwMUSer] = [
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 0,
        xawuxLAiwMEmail: "test@gmail.com",
        xawuxLAiwMPassword: "123456",
        xawuxLAiwMUserName: "elihu rayo",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_0.png",
        xawuxLAiwMFollowing: [1, 2],
        xawuxLAiwMFans: [4, 5],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 1,
        xawuxLAiwMEmail: "upminaa@gmail.com",
        xawuxLAiwMPassword: "8awsaw2q2h1",
        xawuxLAiwMUserName: "upminaa",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_1.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 2,
        xawuxLAiwMEmail: "kaorfiori@gmail.com",
        xawuxLAiwMPassword: "4731901",
        xawuxLAiwMUserName: "kaorfiori",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_2.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 3,
        xawuxLAiwMEmail: "avacherrycos@gmail.com",
        xawuxLAiwMPassword: "4avacherrycos071",
        xawuxLAiwMUserName: "avacherrycos",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_3.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 4,
        xawuxLAiwMEmail: "keithik2@gmail.com",
        xawuxLAiwMPassword: "71846198",
        xawuxLAiwMUserName: "keithik2",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_4.png",
        xawuxLAiwMFollowing: [0],
        xawuxLAiwMFans: [],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 5,
        xawuxLAiwMEmail: "RaElodie@gmail.com",
        xawuxLAiwMPassword: "21wda2asdasd",
        xawuxLAiwMUserName: "Elodie",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_5.png",
        xawuxLAiwMFollowing: [0],
        xawuxLAiwMFans: [],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 6,
        xawuxLAiwMEmail: "Raja1ja@gmail.com",
        xawuxLAiwMPassword: "2821sdda2005",
        xawuxLAiwMUserName: "Liquor",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_6.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 7,
        xawuxLAiwMEmail: "cewjaljxw@gmail.com",
        xawuxLAiwMPassword: "2832005",
        xawuxLAiwMUserName: "Raja",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_7.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 8,
        xawuxLAiwMEmail: "",
        xawuxLAiwMPassword: "",
        xawuxLAiwMUserName: "Visitor_50024",
        xawuxLAiwMAvatar: "cukan_default",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeVideos: [],
        xawuxLAiwMLikePosts: [],
        xawuxLAiwMIsDeleted: false
      ),
    ]

    save(users, forKey: Keys.xawuxLAiwMUsers)
  }

  func getUsers() -> [XawuxLAiwMUSer] {
    load([XawuxLAiwMUSer].self, forKey: Keys.xawuxLAiwMUsers, default: [])
  }

  func saveUsers(_ users: [XawuxLAiwMUSer]) {
    save(users, forKey: Keys.xawuxLAiwMUsers)
  }

  func getUserById(userId: Int) -> XawuxLAiwMUSer? {
    let allUsers = getUsers()
    // 查找第一个 userId 匹配的用户
    return allUsers.first { $0.xawuxLAiwMUserId == userId }
  }

  func updateUser(
    uid: Int,
    update: (XawuxLAiwMUSer) -> XawuxLAiwMUSer
  ) {
    var users = getUsers()
    guard let index = users.firstIndex(where: { $0.xawuxLAiwMUserId == uid }) else { return }
    users[index] = update(users[index])
    saveUsers(users)
  }

  // add user
  func addUser(user: XawuxLAiwMUSer) {
    var users: [XawuxLAiwMUSer] = getUsers()
    users.append(user)
    saveUsers(users)
  }

  // MARK: Login State
  func setCurrentUserId(_ uid: Int) {
    storage.set(uid, forKey: Keys.xigoAuwCurrentUserId)
  }

  func getCurrentUserId() -> Int {
    return storage.object(forKey: Keys.xigoAuwCurrentUserId) as? Int ?? 7700
  }

}

//work
extension XigoAuwStorageManager {

  private func initializeWorksIfNeeded() {
    guard storage.data(forKey: Keys.erwyAuwWorks) == nil else { return }

    let erwyAuwWorks: [ErwyAuwVideo] = [
      ErwyAuwVideo(
        erwyAuwWorkId: 0,
        erwyAuwCreatorId: 0,
        erwyAuwTextContent: "Playing the cosplay in this setting has a unique charm.",
        erwyAuwVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/bdfkuyAwlx_0.mp4",
        erwyAuwVideoCover:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/xkwiLAkwuI_0.png",
        erwyAuwLikeCount: 397,
        erwyAuwDate: Date(timeIntervalSince1970: 1_706_418_600),
        erwyAuwIsDeleted: false),
      ErwyAuwVideo(
        erwyAuwWorkId: 1,
        erwyAuwCreatorId: 1,
        erwyAuwTextContent:
          "Playing the cosplay on the vast snowy ground gives the music a sense of emptiness.",
        erwyAuwVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/bdfkuyAwlx_1.mp4",
        erwyAuwVideoCover:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/xkwiLAkwuI_1.png",
        erwyAuwLikeCount: 727,
        erwyAuwDate: Date(timeIntervalSince1970: 1_706_418_700),
        erwyAuwIsDeleted: false),
      ErwyAuwVideo(
        erwyAuwWorkId: 2,
        erwyAuwCreatorId: 2,
        erwyAuwTextContent:
          "Using the sound of the cosplay to communicate with the world, each note is a gentle expression.",
        erwyAuwVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/bdfkuyAwlx_2.mp4",
        erwyAuwVideoCover:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/xkwiLAkwuI_2.png",
        erwyAuwLikeCount: 986,
        erwyAuwDate: Date(timeIntervalSince1970: 1_706_418_600),
        erwyAuwIsDeleted: false),
      ErwyAuwVideo(
        erwyAuwWorkId: 3,
        erwyAuwCreatorId: 3,
        erwyAuwTextContent: "May everyone who hears this melody be treated with kindness.",
        erwyAuwVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/bdfkuyAwlx_3.mp4",
        erwyAuwVideoCover:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/xkwiLAkwuI_3.png",
        erwyAuwLikeCount: 657,
        erwyAuwDate: Date(timeIntervalSince1970: 1_706_418_600),
        erwyAuwIsDeleted: false),
      ErwyAuwVideo(
        erwyAuwWorkId: 4,
        erwyAuwCreatorId: 4,
        erwyAuwTextContent: "Practice the cosplay seriously and live seriously.",
        erwyAuwVideoUrl:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/bdfkuyAwlx_4.mp4",
        erwyAuwVideoCover:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/xkwiLAkwuI_4.png",
        erwyAuwLikeCount: 1397,
        erwyAuwDate: Date(timeIntervalSince1970: 1_706_418_600),
        erwyAuwIsDeleted: false),

    ]
    save(erwyAuwWorks, forKey: Keys.erwyAuwWorks)
  }

  func getWorks() -> [ErwyAuwVideo] {
    load([ErwyAuwVideo].self, forKey: Keys.erwyAuwWorks, default: [])
  }

  func getWorksNotBlock() -> [ErwyAuwVideo] {
    let allWorks = getWorks()
    let currentUserInfo = getUserById(userId: getCurrentUserId())

    // 用 $0 指代遍历的每个 work 元素
    return allWorks.filter {
      guard let blacklist = currentUserInfo?.xawuxLAiwMBlacklist else { return true }
      return !blacklist.contains($0.erwyAuwCreatorId)
    }
  }

  func getWorkDetailById(workId: Int) -> ErwyAuwVideo? {
    let allWorks = getWorks()
    guard
      let workDetail = allWorks.first(where: {
        $0.erwyAuwWorkId == workId
      })
    else {
      return nil
    }

    return workDetail
  }

  func addWork(_ work: ErwyAuwVideo) {
    var erwyAuwWorks = getWorks()
    erwyAuwWorks.insert(work, at: 0)
    save(erwyAuwWorks, forKey: Keys.erwyAuwWorks)
  }

  func updateWork(_ work: ErwyAuwVideo) {
    var erwyAuwWorks = getWorks()
    guard
      let index = erwyAuwWorks.firstIndex(where: {
        $0.erwyAuwWorkId == work.erwyAuwWorkId
      })
    else {
      return
    }

    erwyAuwWorks[index] = work
  }
    
    // like + 1
    func increaseLikeCount(workId: Int) {
        var erwyAuwWorks = getWorks()
        
        guard let index = erwyAuwWorks.firstIndex(where: {
            $0.erwyAuwWorkId == workId
        }) else {
            return
        }
        
        erwyAuwWorks[index].erwyAuwLikeCount += 1
        
        save(erwyAuwWorks, forKey: Keys.erwyAuwWorks)
    }
    
    // like - 1
    func decreaseLikeCount(workId: Int) {
        var erwyAuwWorks = getWorks()
        
        guard let index = erwyAuwWorks.firstIndex(where: {
            $0.erwyAuwWorkId == workId
        }) else {
            return
        }
        
        if erwyAuwWorks[index].erwyAuwLikeCount > 0 {
            erwyAuwWorks[index].erwyAuwLikeCount -= 1
        }
        
        save(erwyAuwWorks, forKey: Keys.erwyAuwWorks)
    }

  // 软删除
  func deleteWork(_ work: ErwyAuwVideo) {
    var erwyAuwWorks = getWorks()
    guard
      let index = erwyAuwWorks.firstIndex(where: {
        $0.erwyAuwWorkId == work.erwyAuwWorkId
      })
    else {
      return
    }

    erwyAuwWorks[index].erwyAuwIsDeleted = true
  }
}

//Comment
extension XigoAuwStorageManager {

  private func initializeCommentsIfNeeded() {
    guard storage.data(forKey: Keys.manuwqoAiComments) == nil else { return }
    save([ManuwqoAiComment](), forKey: Keys.manuwqoAiComments)
  }

  func getComments(for workId: Int) -> [ManuwqoAiComment] {
    load([ManuwqoAiComment].self, forKey: Keys.manuwqoAiComments, default: [])
      .filter { $0.manuwqoAiCommentWorkId == workId }
  }

  // 获取所有评论
  func getAllComments() -> [ManuwqoAiComment] {
    load([ManuwqoAiComment].self, forKey: Keys.manuwqoAiComments, default: [])
  }

  func addComment(_ comment: ManuwqoAiComment) {
    var manuwqoAiComments = load(
      [ManuwqoAiComment].self, forKey: Keys.manuwqoAiComments, default: [])
    manuwqoAiComments.append(comment)
    save(manuwqoAiComments, forKey: Keys.manuwqoAiComments)
  }

  func deleteComment(_ comment: ManuwqoAiComment) {
    var comments = load(
      [ManuwqoAiComment].self,
      forKey: Keys.manuwqoAiComments,
      default: []
    )

    comments.removeAll { $0.id == comment.id }

    save(comments, forKey: Keys.manuwqoAiComments)
  }
}

//ChatRoom & Message
extension XigoAuwStorageManager {

  private func initializeChatRoomsIfNeeded() {
    guard storage.data(forKey: Keys.sswzuLwoqxChatRooms) == nil else { return }
    save([SswzuLwoqxChatRoom](), forKey: Keys.sswzuLwoqxChatRooms)
  }

  func getChatRooms() -> [SswzuLwoqxChatRoom] {
    load([SswzuLwoqxChatRoom].self, forKey: Keys.sswzuLwoqxChatRooms, default: [])
  }

  // 创建聊天室
  func createChatRoom(chatUsersId: [Int]) -> SswzuLwoqxChatRoom {
    var sswzuLwoqxChatRooms: [SswzuLwoqxChatRoom] = getChatRooms()
    let newRoom: SswzuLwoqxChatRoom = SswzuLwoqxChatRoom(
      sswzuLwoqxRoomId: sswzuLwoqxChatRooms.count,
      sswzuLwoqxChatUsers: chatUsersId,
      sswzuLwoqxLastSendMsg: "",
      sswzuLwoqxLastSendTime: Date(),
      sswzuLwoqxUnreadCount: 0,
      sswzuLwoqxIsDeleted: false
    )
    sswzuLwoqxChatRooms.append(newRoom)
    save(sswzuLwoqxChatRooms, forKey: Keys.sswzuLwoqxChatRooms)

    return newRoom
  }
  // 更新聊天室
  func updateChatRoom(roomId: Int, update: (SswzuLwoqxChatRoom) -> SswzuLwoqxChatRoom) {
    var sswzuLwoqxChatRooms: [SswzuLwoqxChatRoom] = getChatRooms()
    guard let index = sswzuLwoqxChatRooms.firstIndex(where: { $0.sswzuLwoqxRoomId == roomId })
    else {
      return
    }
    sswzuLwoqxChatRooms[index] = update(sswzuLwoqxChatRooms[index])
    save(sswzuLwoqxChatRooms, forKey: Keys.sswzuLwoqxChatRooms)
  }

  private func initializeMessagesIfNeeded() {
    guard storage.data(forKey: Keys.sswzuLwoqxMessages) == nil else { return }
    save([SswzuLwoqxMessage](), forKey: Keys.sswzuLwoqxMessages)
  }

  func getMessages(roomId: Int) -> [SswzuLwoqxMessage] {
    return load([SswzuLwoqxMessage].self, forKey: Keys.sswzuLwoqxMessages, default: [])
      .filter { $0.nuwzawiGhrdcjsRoomId == roomId }
  }

  func addMessage(_ msg: SswzuLwoqxMessage) {
    var sswzuLwoqxMessages = load(
      [SswzuLwoqxMessage].self, forKey: Keys.sswzuLwoqxMessages, default: [])
    sswzuLwoqxMessages.append(msg)
    save(sswzuLwoqxMessages, forKey: Keys.sswzuLwoqxMessages)
  }
}


extension XigoAuwStorageManager {
  private func initializeCosplayPostsIfNeeded() {
    guard storage.data(forKey: Keys.cosplayPosts) == nil else { return }
    let wUiqbahCosPosts: [WUiqbahCosPosts] = [
      WUiqbahCosPosts(
        wUiqbahCosPostsId: 0,
        wUiqbahCosPostsUserId: 5,
        wUiqbahCosPostsImageList:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/i4wkjcnw_0.png",
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/i4wkjcnw_1.png"],
        wUiqbahCosPostsText:
          "task",
        wUiqbahCosPostsDate: Date(timeIntervalSince1970: 1_706_418_600),
        wUiqbahCosPostsLikesCount: 461,
        wUiqbahCosPostsIsDeleted: false
      ),
      WUiqbahCosPosts(
        wUiqbahCosPostsId: 1,
        wUiqbahCosPostsUserId: 6,
        wUiqbahCosPostsImageList:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/i4wkjcnw_2.png",
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/i4wkjcnw_3.png"],
        wUiqbahCosPostsText:
          "Joined the Sith after being threatened by Djaron",
        wUiqbahCosPostsDate: Date(timeIntervalSince1970: 1_706_418_600),
        wUiqbahCosPostsLikesCount: 723,
        wUiqbahCosPostsIsDeleted: false
      ),
      WUiqbahCosPosts(
        wUiqbahCosPostsId: 2,
        wUiqbahCosPostsUserId: 7,
        wUiqbahCosPostsImageList:
          ["http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/i4wkjcnw_4.png",
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/i4wkjcnw_5.png"],
        wUiqbahCosPostsText:
          "What should I say when I see Barbie?",
        wUiqbahCosPostsDate: Date(timeIntervalSince1970: 1_706_418_600),
        wUiqbahCosPostsLikesCount: 235,
        wUiqbahCosPostsIsDeleted: false
      )
    ]
    save(wUiqbahCosPosts, forKey: Keys.cosplayPosts)
  }

  func getCosplayPosts() -> [WUiqbahCosPosts] {
    load([WUiqbahCosPosts].self, forKey: Keys.cosplayPosts, default: [])
  }

  func addCosplayPosts(_ history: WUiqbahCosPosts) {
    var histories = load([WUiqbahCosPosts].self, forKey: Keys.cosplayPosts, default: [])
    histories.append(history)
    save(histories, forKey: Keys.cosplayPosts)
  }
    
    // like + 1
    func increaseCosplayPostLikeCount(postId: Int) {
        var posts = getCosplayPosts()
        
        guard let index = posts.firstIndex(where: {
            $0.wUiqbahCosPostsId == postId
        }) else {
            return
        }
        
        posts[index].wUiqbahCosPostsLikesCount += 1
        
        save(posts, forKey: Keys.cosplayPosts)
    }
    
    // like - 1
    func decreaseCosplayPostLikeCount(postId: Int) {
        var posts = getCosplayPosts()
        
        guard let index = posts.firstIndex(where: {
            $0.wUiqbahCosPostsId == postId
        }) else {
            return
        }
        
        if posts[index].wUiqbahCosPostsLikesCount > 0 {
            posts[index].wUiqbahCosPostsLikesCount -= 1
        }
        
        save(posts, forKey: Keys.cosplayPosts)
    }

  // 根据用户Id删除所有
    func deleteCosplayPostsByUserId(_ userId: Int) {
        let histories: [WUiqbahCosPosts] = load(
            [WUiqbahCosPosts].self,
            forKey: Keys.cosplayPosts,
            default: []
        )
        
        let updated = histories.map { post in
            var post = post
            if post.wUiqbahCosPostsUserId == userId {
                post.wUiqbahCosPostsIsDeleted = true
            }
            return post
        }
        
        save(updated, forKey: Keys.cosplayPosts)
    }
}

//底层通用存取（核心）
extension XigoAuwStorageManager {

  fileprivate func save<T: Codable>(_ value: T, forKey key: String) {
    if let data = try? JSONEncoder().encode(value) {
      storage.set(data, forKey: key)
    }
  }

  fileprivate func load<T: Codable>(
    _ type: T.Type,
    forKey key: String,
    default defaultValue: T
  ) -> T {
    guard
      let data = storage.data(forKey: key),
      let value = try? JSONDecoder().decode(type, from: data)
    else {
      return defaultValue
    }
    return value
  }
}
