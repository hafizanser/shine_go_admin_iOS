//
//  Enums.swift
//  NVITE
//
//  Created by Hafiz Anser on 20/05/2021.
//

import Foundation

enum APIUrlType:Int {
    case dev = 1
    case staging = 2
    case live = 3
}

enum DeviceType : String {
    case android = "ANDROID"
    case iOS = "IOS"
}

enum ThreadSelectedType {
    case directMessage
    case liveChat
}

enum homeSelectedType {
    case upcomingLiveStreams
    case paidLiveStreams
    case openLiveStreams
    case openChatRooms
    case suggestedPeople
}

enum DMBlastSelectedType {
    case blastWall
    case myBlasts
}

enum LiveStreamAboutType {
    case information
    case audience
}

enum SearchSelectedType {
    case streams
    case chatrooms
    case people
    case none
}

enum CreateNewType {
    case schedule
    case goLive
    case liveChatRoom
}

enum CreateScheduleType {
    case free
    case subscribed
}

enum exerciseSelectedSetType : String {
    case Reps = "repetitions"
    case interval = "interval"
}

enum ProfileType : String {
    case admin = "admin"
    case domestic = "domestic"
    case internaltional = "international"
}

enum MediaType {
    case image
    case video
}

enum SocialLoginType : String {
    case Google = "google"
    case Facebook = "facebook"
    case Apple = "apple"
}

enum adsSelectedType {
    case active
    case pending
    case removed
}

enum DataType : String {
    case hasData
    case noData
}

enum TableViewState {
    case showingCategories
    case empty
    case showingMyAds
}
