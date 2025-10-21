//
//  Media.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/03/2021.
//

import UIKit

struct Media {
    let key: String
    let filename: String
    let data: Data
    let mimeType: String
    
    init?(withImage image: UIImage, forKey key: String) {
        self.key = key
        self.mimeType = "image/jpeg"
        self.filename = "Bioceuticalprofile.jpg"
        
        guard let data = image.jpegData(compressionQuality: 0.5) else { return nil }
        self.data = data
    }
    
    init?(withVideo videoUrl: URL, forKey key: String) {
        self.key = key
        self.mimeType = "video/mp4"
        self.filename = "video.mp4"
        
        guard let data = try? Data(contentsOf: videoUrl) else {return nil}
        self.data = data
    }
    
    init?(withVideoData videoData: Data, forKey key: String) {
           self.key = key
           self.mimeType = "video/mp4"
           self.filename = "video.mp4"
           
           //guard let data = try? Data(contentsOf: videoUrl) else {return nil}
           self.data = videoData
       }
    
    init?(withGif gifData: Data, forKey key: String) {
           self.key = key
           self.mimeType = "image/gif"
           self.filename = "animated.gif"
           
           self.data = gifData
       }
    
}

struct MediaFile: Codable {
    let mediaID: Int
    let mediaURL: String
    let thumbnailURL: String
    let isVideo: Bool
    let mediaType: Int?
    let roomName:String?
    
}
