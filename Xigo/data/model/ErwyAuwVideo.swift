import SwiftUI

struct ErwyAuwVideo: Codable, Identifiable, Equatable {

  let erwyAuwWorkId: Int
  var erwyAuwCreatorId: Int
  var erwyAuwTextContent: String
  var erwyAuwVideoUrl: String
  var erwyAuwVideoCover: String
  var erwyAuwLikeCount: Int
  var erwyAuwDate: Date
  var erwyAuwIsDeleted: Bool

  var id: Int { erwyAuwWorkId }
}

@MainActor
final class ErwyAuwVideoViewModel: ObservableObject {

  @Published var allWorks: [ErwyAuwVideo] = []
  @Published var allNotBlockWorks: [ErwyAuwVideo] = []
//  @Published var userWorks: [ErwyAuwVideo] = []
  @Published var myFollowingUserWorks: [ErwyAuwVideo] = []
  @Published var workDetail: ErwyAuwVideo?

  private let storage = XigoAuwStorageManager.shared

  func getAllErwyAuwWorks() {
    allWorks = storage.getWorks()
  }

  func getAllNotBlockErwyAuwWorks() {
    let allWorks: [ErwyAuwVideo] = storage.getWorks()
    if let cnaiwjdMyInfo = storage.getUserById(userId: storage.getCurrentUserId()) {
      allNotBlockWorks = allWorks.filter {
        !cnaiwjdMyInfo.xawuxLAiwMBlacklist.contains($0.erwyAuwCreatorId)
          && !$0.erwyAuwIsDeleted
      }
    }

  }

  func getErwyAuwWorksByUserId(userId: Int) -> [ErwyAuwVideo] {
    let allPostWorks: [ErwyAuwVideo] = storage.getWorks()
    return allPostWorks.filter {
      $0.erwyAuwCreatorId == userId && !$0.erwyAuwIsDeleted
    }
  }

  func getMyFollowingErwyAuwWorks() {
    let currentUserId = storage.getCurrentUserId()
    guard let currentUserInfo: XawuxLAiwMUSer = storage.getUserById(userId: currentUserId)
    else {
      return
    }
    let allPostWorks: [ErwyAuwVideo] = storage.getWorks()
    let myFollowingWorks: [ErwyAuwVideo] = allPostWorks.filter {
      currentUserInfo.xawuxLAiwMFollowing.contains($0.erwyAuwCreatorId)
        && !currentUserInfo.xawuxLAiwMBlacklist.contains($0.erwyAuwCreatorId)
        && !$0.erwyAuwIsDeleted
    }
    myFollowingUserWorks = myFollowingWorks
  }

  func getErwyAuwWorkDetailByWorkId(workId: Int) {
    workDetail = storage.getWorkDetailById(workId: workId)
  }

  // 根据用户ID获取用户信息（封装存储层方法）
  func getUserByCreatorId(creatorId: Int) -> XawuxLAiwMUSer? {
    return storage.getUserById(userId: creatorId)
  }

  // 添加新作品
  func addNewErwyAuwWork(textContent: String, videoUrl: String, videoCover: String)
    -> Int
  {
    let postUserId: Int = storage.getCurrentUserId()
    getAllErwyAuwWorks()
    let newWorkId = allWorks.count

    let newWork: ErwyAuwVideo = ErwyAuwVideo(
      erwyAuwWorkId: newWorkId, erwyAuwCreatorId: postUserId,
      erwyAuwTextContent: textContent, erwyAuwVideoUrl: videoUrl,
      erwyAuwVideoCover: videoCover, erwyAuwLikeCount: 0, erwyAuwDate: Date(),
      erwyAuwIsDeleted: false)
    storage.addWork(newWork)
    getAllNotBlockErwyAuwWorks()
    return newWorkId
  }

  // 删除
  func deleteMyErwyAuwWorks() {
    let currentUserId = storage.getCurrentUserId()
    // 软删除: 将我的所有作品标记为已删除
    let erwyAuwMyWorks = allWorks.filter {
      $0.erwyAuwCreatorId == currentUserId && !$0.erwyAuwIsDeleted
    }
    for work in erwyAuwMyWorks {
      storage.deleteWork(work)
    }
  }
}
