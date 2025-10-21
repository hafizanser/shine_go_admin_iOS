//
//  Common.swift
//  MYBT
//
//  Created by Hafiz Anser on 15/02/2021.
//

import Foundation
import UIKit
import Photos

class Common {
    
    class func getImageFromAsset(asset: PHAsset, completionHandler: ((UIImage?) -> Void)?) {
        let options = PHImageRequestOptions()
        options.isSynchronous = false
        options.isNetworkAccessAllowed = false
        options.deliveryMode = .highQualityFormat
        
        PHImageManager.default().requestImageData(for: asset, options: options) { data, uti, orientation, info in
            guard let info = info else { return }
            
            if let error = info[PHImageErrorKey] as? Error {
                print("Cannot fetch data for GIF image: \(error)")
                completionHandler?(nil)
                return
            }
            
            if let isInCould = info[PHImageResultIsInCloudKey] as? Bool, isInCould {
                print("Cannot fetch data from cloud. Option for network access not set.")
                completionHandler?(nil)
                return
            }
            
            if let imageData = data {
                let pickedImage = UIImage(data: imageData) ?? Icons.RECTANGLE_PLACEHOLDER!
                completionHandler?(pickedImage)
            } else {
                completionHandler?(nil)
            }
        }
    }
    
    class func changeDeviceOrientationForGameScreen(isAppear: Bool) {
        if isAppear {
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        } else {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
    }
    
    class func changeDeviceOrientationForNonGameScreen(isAppear: Bool) {
        if isAppear {
            let value = UIInterfaceOrientation.portrait.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        } else {
            let value = UIInterfaceOrientation.landscapeRight.rawValue
            UIDevice.current.setValue(value, forKey: "orientation")
        }
    }
    
    class func getMp4UrlFromAsset(asset: PHAsset, completionHandler: ((URL?) -> Void)?) {
        PHImageManager.default().requestAVAsset(forVideo: asset, options: nil) { (asset, audioMix, info) in
            guard let asset = asset else { return }
            
            let manager = FileManager.default
            guard let documentDirectory = try? manager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else {return}
            
            var outputURL = documentDirectory.appendingPathComponent("output")
            do {
                try manager.createDirectory(at: outputURL, withIntermediateDirectories: true, attributes: nil)
                outputURL = outputURL.appendingPathComponent("output.mp4")
            }catch let error {
                print(error)
            }
            
            //Remove existing file
            _ = try? manager.removeItem(at: outputURL)
            
            guard let exportSession = AVAssetExportSession(asset: asset, presetName: AVAssetExportPresetMediumQuality) else {return}
            exportSession.outputURL = outputURL
            exportSession.outputFileType = AVFileType.mp4
            
            exportSession.exportAsynchronously{
                switch exportSession.status {
                case .completed:
                    DispatchQueue.main.async {
                        let mp4url = outputURL
                        completionHandler?(mp4url)
                    }
                case .failed:
                    print("failed \(String(describing: exportSession.error))")
                    completionHandler?(nil)
                case .cancelled:
                    print("cancelled \(String(describing: exportSession.error))")
                    completionHandler?(nil)
                    
                default: break
                }
            }
        }
    }
    
    class func getThumbnailImageFromVideoUrl(url: URL, completion: @escaping ((_ image: UIImage?)->Void)) {
        DispatchQueue.global().async { //1
            let asset = AVAsset(url: url) //2
            let avAssetImageGenerator = AVAssetImageGenerator(asset: asset) //3
            avAssetImageGenerator.appliesPreferredTrackTransform = true //4
            let thumnailTime = CMTimeMake(value: 2, timescale: 1) //5
            do {
                let cgThumbImage = try avAssetImageGenerator.copyCGImage(at: thumnailTime, actualTime: nil) //6
                let thumbImage = UIImage(cgImage: cgThumbImage) //7
                DispatchQueue.main.async { //8
                    completion(thumbImage) //9
                }
            } catch {
                print(error.localizedDescription) //10
                DispatchQueue.main.async {
                    completion(nil) //11
                }
            }
        }
    }
}
