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
    static let violinRecord: String = "violinRecord"
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
    initializeViolinRecordIfNeeded()
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
        xawuxLAiwMFollowing: [1],
        xawuxLAiwMFans: [],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 1000,
        xawuxLAiwMLikeWorks: [],
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
        xawuxLAiwMLikeWorks: [],
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
        xawuxLAiwMLikeWorks: [],
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
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeWorks: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 4,
        xawuxLAiwMEmail: "keithik2@gmail.com",
        xawuxLAiwMPassword: "71846198",
        xawuxLAiwMUserName: "keithik2",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_4.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeWorks: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 5,
        xawuxLAiwMEmail: "Raja1ja@gmail.com",
        xawuxLAiwMPassword: "2832005",
        xawuxLAiwMUserName: "Raja",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_5.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeWorks: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 6,
        xawuxLAiwMEmail: "Raja1ja@gmail.com",
        xawuxLAiwMPassword: "2832005",
        xawuxLAiwMUserName: "Raja",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_6.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeWorks: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 7,
        xawuxLAiwMEmail: "Raja1ja@gmail.com",
        xawuxLAiwMPassword: "2832005",
        xawuxLAiwMUserName: "Raja",
        xawuxLAiwMAvatar:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/Xigo2026/lkwijaxiw_7.png",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [0],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeWorks: [],
        xawuxLAiwMIsDeleted: false
      ),
      XawuxLAiwMUSer(
        xawuxLAiwMUserId: 8,
        xawuxLAiwMEmail: "",
        xawuxLAiwMPassword: "",
        xawuxLAiwMUserName: "Visitor_40024",
        xawuxLAiwMAvatar: "cponlzna_default_avatar",
        xawuxLAiwMFollowing: [],
        xawuxLAiwMFans: [],
        xawuxLAiwMBlacklist: [],
        xawuxLAiwMWalletBalance: 0,
        xawuxLAiwMLikeWorks: [],
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
        erwyAuwTextContent: "Playing the violin in this setting has a unique charm.",
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
          "Playing the violin on the vast snowy ground gives the music a sense of emptiness.",
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
          "Using the sound of the violin to communicate with the world, each note is a gentle expression.",
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
        erwyAuwTextContent: "Practice the violin seriously and live seriously.",
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

// moive
extension XigoAuwStorageManager {
  private func initializeViolinRecordIfNeeded() {
    guard storage.data(forKey: Keys.violinRecord) == nil else { return }
    let jflawhPracRecord: [JflawhPracRecord] = [
      JflawhPracRecord(
        jflawhPracRecordUserId: 0,
        jflawhPracRecordImage:
          "http://huanniuchat.oss-accelerate.aliyuncs.com/XigoAuw2026/wiancz_practice.jpg",
        jflawhPracRecordText:
          "Good concentration, core tasks fully practiced with obvious improvement; slight instability in bow tip/root bowing, stiff finger shifting in high positions, rigid dotted rhythm handling",
        jflawhPracRecordStatus: 3,
        jflawhPracRecordPracticeDuration: "1h 30min",
        jflawhPracRecordDate: Date(timeIntervalSince1970: 1_706_418_600)
      )
    ]
    save(jflawhPracRecord, forKey: Keys.violinRecord)
  }

  func getViolinRecord() -> [JflawhPracRecord] {
    load([JflawhPracRecord].self, forKey: Keys.violinRecord, default: [])
  }

  func addViolinRecord(_ history: JflawhPracRecord) {
    var histories = load([JflawhPracRecord].self, forKey: Keys.violinRecord, default: [])
    histories.append(history)
    save(histories, forKey: Keys.violinRecord)
  }

  func deleteViolinRecord(_ workId: UUID) {
    var histories: [JflawhPracRecord] = load(
      [JflawhPracRecord].self, forKey: Keys.violinRecord, default: [])
    histories.removeAll {
      $0.id == workId
    }
    save(histories, forKey: Keys.violinRecord)
  }

  // 根据用户Id删除所有
  func deleteViolinRecordByUserId(_ userId: Int) {
    var histories: [JflawhPracRecord] = load(
      [JflawhPracRecord].self, forKey: Keys.violinRecord, default: [])
    histories.removeAll {
      $0.jflawhPracRecordUserId == userId
    }
    save(histories, forKey: Keys.violinRecord)
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
