import SwiftUI

// 练习记录
struct WUiqbahCosPosts: Codable, Identifiable, Equatable {
  let wUiqbahCosPostsId: Int
  var wUiqbahCosPostsUserId: Int
  var wUiqbahCosPostsImageList: [String]
  var wUiqbahCosPostsText: String
  var wUiqbahCosPostsDate: Date
    var wUiqbahCosPostsLikesCount: Int
    var wUiqbahCosPostsIsDeleted: Bool

    var id: Int { wUiqbahCosPostsId }
}

@MainActor
final class WUiqbahCosPostsViewModel: ObservableObject {

  @Published var allNotBlockPosts: [WUiqbahCosPosts] = []

  private let storage: XigoAuwStorageManager = XigoAuwStorageManager.shared

  func getAllNotBlockwUiqbahCosPosts() {
    let fuenlasa: [WUiqbahCosPosts] = storage.getCosplayPosts()
      if let cnaiwjdMyInfo = storage.getUserById(userId: storage.getCurrentUserId()) {
          allNotBlockPosts = fuenlasa.filter {
              !cnaiwjdMyInfo.xawuxLAiwMBlacklist.contains($0.wUiqbahCosPostsUserId)
              && !$0.wUiqbahCosPostsIsDeleted
        }
      }
  }
    
    func getUiqbahCosPostsByUserId(_ userId: Int) -> [WUiqbahCosPosts] {
      let fuenlasa: [WUiqbahCosPosts] = storage.getCosplayPosts()
        
        return fuenlasa.filter {
        $0.wUiqbahCosPostsUserId == storage.getCurrentUserId()
      }
    }
    
    func getUiqbahCosPostsByPostID(_ postId: Int) -> WUiqbahCosPosts? {
        let fuenlasa: [WUiqbahCosPosts] = storage.getCosplayPosts()
          
          return fuenlasa.first {
              $0.wUiqbahCosPostsId == postId
        }
    }

    func softDeletePostsByUserId(_ userId: Int) {
        storage.deleteCosplayPostsByUserId(userId)
      getAllNotBlockwUiqbahCosPosts()
  }

  // 添加
  func addMyPosts(_ cnwianz: String, imageList: [String]) -> Int {
      let newPostId = storage.getWorks().count
    storage.addCosplayPosts(
      WUiqbahCosPosts(
        wUiqbahCosPostsId: newPostId,
        wUiqbahCosPostsUserId: storage.getCurrentUserId(),
        wUiqbahCosPostsImageList: imageList,
        wUiqbahCosPostsText: cnwianz,
        wUiqbahCosPostsDate: Date(),
        wUiqbahCosPostsLikesCount: 0,
        wUiqbahCosPostsIsDeleted: false
      ))
      getAllNotBlockwUiqbahCosPosts()
      return newPostId
  }
}
