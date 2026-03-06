import SwiftUI

struct ManuwqoAiComment: Codable, Identifiable, Equatable {

  let id: UUID = UUID()

  var manuwqoAiCommentWorkId: Int
  var manuwqoAiCommentUserId: Int
  var manuwqoAiCommentText: String
  var manuwqoAiDate: Date

  enum CodingKeys: String, CodingKey {
    case manuwqoAiCommentWorkId
    case manuwqoAiCommentUserId
    case manuwqoAiCommentText
    case manuwqoAiDate
  }
}

@MainActor
final class ManuwqoAiCommentsViewModel: ObservableObject {

  @Published var workCommentsNotBlock: [ManuwqoAiComment] = []

  private let storage = XigoAuwStorageManager.shared

  func getManuwqoAiCommentsNotBlockByWorkId(workId: Int) {
    let allComments: [ManuwqoAiComment] = storage.getComments(for: workId)
    guard let loginUserInfo = storage.getUserById(userId: storage.getCurrentUserId())
    else {
      return
    }
    workCommentsNotBlock = allComments.filter {
      !loginUserInfo.xawuxLAiwMBlacklist.contains($0.manuwqoAiCommentUserId)
    }
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
