import SwiftUI

struct ManuwqoAiComment: Codable, Identifiable, Equatable {

  let id: UUID = UUID()

  var manuwqoAiCommentWorkId: Int
  var manuwqoAiCommentUserId: Int
  var manuwqoAiCommentText: String
    var manuwqoAiCommentIsVideo: Bool
  var manuwqoAiDate: Date

  enum CodingKeys: String, CodingKey {
    case manuwqoAiCommentWorkId
    case manuwqoAiCommentUserId
    case manuwqoAiCommentText
      case manuwqoAiCommentIsVideo
    case manuwqoAiDate
  }
}

@MainActor
final class ManuwqoAiCommentsViewModel: ObservableObject {

  @Published var videoCommentsNotBlock: [ManuwqoAiComment] = []
    @Published var cosPostCommentsNotBlock: [ManuwqoAiComment] = []

  private let storage = XigoAuwStorageManager.shared

  func getVideoManuwqoAiCommentsNotBlockByWorkId(workId: Int) {
    let allComments: [ManuwqoAiComment] = storage.getComments(for: workId)
    guard let loginUserInfo = storage.getUserById(userId: storage.getCurrentUserId())
    else {
      return
    }
      videoCommentsNotBlock = allComments.filter {
      !loginUserInfo.xawuxLAiwMBlacklist.contains($0.manuwqoAiCommentUserId)
          && $0.manuwqoAiCommentIsVideo
    }
  }
    
    func getCosPostManuwqoAiCommentsNotBlockByWorkId(workId: Int) {
      let allComments: [ManuwqoAiComment] = storage.getComments(for: workId)
      guard let loginUserInfo = storage.getUserById(userId: storage.getCurrentUserId())
      else {
        return
      }
        videoCommentsNotBlock = allComments.filter {
        !loginUserInfo.xawuxLAiwMBlacklist.contains($0.manuwqoAiCommentUserId)
            && !$0.manuwqoAiCommentIsVideo
      }
    }
    
    func getVideoManuwqoAiCommentsNotBlockCountByWorkId(workId: Int) -> Int {
      let allComments: [ManuwqoAiComment] = storage.getComments(for: workId)
      guard let loginUserInfo = storage.getUserById(userId: storage.getCurrentUserId())
      else {
        return 0
      }
      let workManuwqoAiCommentsNotBlock = allComments.filter {
        !loginUserInfo.xawuxLAiwMBlacklist.contains($0.manuwqoAiCommentUserId)
          && $0.manuwqoAiCommentIsVideo
      }
        return workManuwqoAiCommentsNotBlock.count
    }
    
    func getCosPostManuwqoAiCommentsNotBlockCountByWorkId(workId: Int) -> Int {
      let allComments: [ManuwqoAiComment] = storage.getComments(for: workId)
      guard let loginUserInfo = storage.getUserById(userId: storage.getCurrentUserId())
      else {
        return 0
      }
      let workManuwqoAiCommentsNotBlock = allComments.filter {
        !loginUserInfo.xawuxLAiwMBlacklist.contains($0.manuwqoAiCommentUserId)
          && !$0.manuwqoAiCommentIsVideo
      }
        return workManuwqoAiCommentsNotBlock.count
    }

  func getManuwqoAiCommetUserInfo(userId: Int) -> XawuxLAiwMUSer? {
    return storage.getUserById(userId: userId)
  }

  func addManuwqoAiCommentItem(commentItem: ManuwqoAiComment) {
    storage.addComment(commentItem)

  }

  // 删除我的所有评论
  func deleteManuwqoAiCommentItem() {
    let currentUserId = storage.getCurrentUserId()
    let allComments = storage.getAllComments()
    for comment in allComments {
      if comment.manuwqoAiCommentUserId == currentUserId {
        storage.deleteComment(comment)
      }
    }
  }
}
