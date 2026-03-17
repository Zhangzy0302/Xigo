import SwiftUI

struct SswzuLwoqxChatRoom: Codable, Identifiable, Equatable {

  let sswzuLwoqxRoomId: Int
  var sswzuLwoqxChatUsers: [Int]
  var sswzuLwoqxLastSendMsg: String
  var sswzuLwoqxLastSendTime: Date
  var sswzuLwoqxUnreadCount: Int
  var sswzuLwoqxIsDeleted: Bool

  var id: Int { sswzuLwoqxRoomId }
}

struct SswzuLwoqxMessage: Codable, Identifiable, Equatable {

  let id: UUID = UUID()

  var nuwzawiGhrdcjsRoomId: Int
  var sswzuLwoqxSendUserId: Int
  var sswzuLwoqxTextMsg: String
  var sswzuLwoqxImageMsg: String
  var sswzuLwoqxAudioMsg: String
  var sswzuLwoqxAudioTime: String
  var sswzuLwoqxDate: Date

  enum CodingKeys: String, CodingKey {
    case nuwzawiGhrdcjsRoomId
    case sswzuLwoqxSendUserId
    case sswzuLwoqxTextMsg
    case sswzuLwoqxDate
    case sswzuLwoqxImageMsg
    case sswzuLwoqxAudioMsg
    case sswzuLwoqxAudioTime
  }
}

@MainActor
final class SswzuLwoqxChatViewModel: ObservableObject {

  @Published var myChatRooms: [SswzuLwoqxChatRoom] = []
  @Published var chatMessageList: [SswzuLwoqxMessage] = []

  private let storage = XigoAuwStorageManager.shared

  func getSswzuLwoqxChatUserId(chatRoomId: Int) -> Int? {
    guard
      let chatRoomInfo = storage.getChatRooms().first(where: {
        $0.sswzuLwoqxRoomId == chatRoomId
      })
    else {
      return nil
    }
    guard
      let chatUserId = chatRoomInfo.sswzuLwoqxChatUsers.first(where: {
        $0 != storage.getCurrentUserId()
      })
    else {
      return nil
    }

    return chatUserId
  }

  func getMySswzuLwoqxChatRoomsNotBlock() {
    let bhajaAllChatRooms = storage.getChatRooms()
    let loginUserId = storage.getCurrentUserId()
    guard let myInfo = storage.getUserById(userId: loginUserId) else {
      return
    }

    myChatRooms = bhajaAllChatRooms.filter {
      if let chatUserId = getSswzuLwoqxChatUserId(chatRoomId: $0.sswzuLwoqxRoomId) {
        $0.sswzuLwoqxChatUsers.contains(loginUserId)
          && !myInfo.xawuxLAiwMBlacklist.contains(chatUserId) && !$0.sswzuLwoqxIsDeleted
      } else {
        false
      }

    }
  }

  // 获取聊天用户信息
  func getSswzuLwoqxChatUserInfo(chatRoomId: Int) -> XawuxLAiwMUSer? {
    guard let chatUserId = getSswzuLwoqxChatUserId(chatRoomId: chatRoomId) else {
      return nil
    }
    return storage.getUserById(userId: chatUserId)
  }

  // 获取聊天消息列表
  func getSswzuLwoqxMessageListByChatId(chatRoomId: Int) {
    chatMessageList = storage.getMessages(roomId: chatRoomId)
  }

  // 发送消息
  func addMessage(sendMsg: SswzuLwoqxMessage) {
    storage.addMessage(sendMsg)
    getSswzuLwoqxMessageListByChatId(chatRoomId: sendMsg.nuwzawiGhrdcjsRoomId)
    storage.updateChatRoom(roomId: sendMsg.nuwzawiGhrdcjsRoomId) { room in
      var newRoom: SswzuLwoqxChatRoom = room
      if !sendMsg.sswzuLwoqxTextMsg.isEmpty {
        newRoom.sswzuLwoqxLastSendMsg = sendMsg.sswzuLwoqxTextMsg
      } else if !sendMsg.sswzuLwoqxAudioMsg.isEmpty {
        newRoom.sswzuLwoqxLastSendMsg = "[audio]"
      } else if !sendMsg.sswzuLwoqxImageMsg.isEmpty {
          newRoom.sswzuLwoqxLastSendMsg = "[picture]"
      }
      newRoom.sswzuLwoqxLastSendTime = Date()
      return newRoom
    }
    getMySswzuLwoqxChatRoomsNotBlock()
  }

  // 查找或创建聊天室
  func findOrCreateSswzuLwoqxChatRoom(chatUserId: Int) -> SswzuLwoqxChatRoom {
    let loginUserId = storage.getCurrentUserId()
    // 查找聊天室是否已存在
    let chatRoom: SswzuLwoqxChatRoom? = storage.getChatRooms().first(where: {
      $0.sswzuLwoqxChatUsers.contains(chatUserId)
        && $0.sswzuLwoqxChatUsers.contains(loginUserId)
    })
    if let chatRoom: SswzuLwoqxChatRoom = chatRoom {
      return chatRoom
    }
    return storage.createChatRoom(chatUsersId: [loginUserId, chatUserId])
  }
    
    /// 将所有未删除且包含自己 ID 的聊天室标记为已删除
    func markAllMyChatRoomsAsDeleted() {
        let myUserId = storage.getCurrentUserId()
        
        // 遍历所有聊天室
        let allRooms = storage.getChatRooms()
        for room in allRooms {
            // 条件：未删除 + 包含自己
            if !room.sswzuLwoqxIsDeleted && room.sswzuLwoqxChatUsers.contains(myUserId) {
                storage.updateChatRoom(roomId: room.sswzuLwoqxRoomId) { oldRoom in
                    var updatedRoom = oldRoom
                    updatedRoom.sswzuLwoqxIsDeleted = true
                    return updatedRoom
                }
            }
        }
        
        // 更新本地 ViewModel
        getMySswzuLwoqxChatRoomsNotBlock()
    }
}
