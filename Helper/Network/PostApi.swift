//
//  PostApi.swift
//
//  Created by Can on 10/25/18.
//  Copyright © 2018 messagemuse. All rights reserved.
//

import UIKit

class APIGeneric<response: Codable> {
    
    static func fetchRequest(apiURL:String ,onCompletion: @escaping (Result<response,Error>) -> Void) {
        print(apiURL)
        NetworkService.shared.fetchData(requestType: .get, fromURL: apiURL, parameters: [:]) { (error:Error?, jsonData:Data?, statusCode:Int?) in
            if let err = error {
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)
                    
                    if statusCode == 200 || statusCode == 400 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let err = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(err))
                }
            }
        }
    }
    
    static func deleteRequest(apiURL:String ,onCompletion: @escaping (Result<response,Error>) -> Void) {
        print(apiURL)
        NetworkService.shared.fetchUpdateData(requestType: .delete, fromURL: apiURL, parameters: [:]) { (error:Error?, jsonData:Data?, statusCode:Int?) in
            if let err = error{
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    //print(jsonResponse)
                    #if DEBUG
                    print(jsonResponse)
                    #else
                    //print(jsonResponse)
                    #endif
                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let errr = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(errr))
                }
            }
        }
    }
    
    static func fetchRequestWithOutToken(apiURL:String ,onCompletion: @escaping (Result<response,Error>) -> Void) {
        print(apiURL)
        NetworkService.shared.fetchDataWithoutToekn(requestType: .get, fromURL: apiURL, parameters: [:]) { (error:Error?, jsonData:Data?, statusCode:Int?) in
            if let err = error {
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)
                    
                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let err = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(err))
                }
            }
        }
    }
    
    
    
    static func fetchRequestWithDoubleTokens(apiURL:String ,onCompletion: @escaping (Result<response,Error>) -> Void) {
        print(apiURL)
        NetworkService.shared.fetchDataWithTwoTokens(requestType: .get, fromURL: apiURL, parameters: [:]) { (error:Error?, jsonData:Data?, statusCode:Int?) in
            if let err = error {
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)
                    
                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let err = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(err))
                }
            }
        }
    }
}

class PostAPIGeneric<request: Codable,response: Codable> {
    
    static func postRequest(apiURL:String, requestModel:request,onCompletion: @escaping (Result<response,Error>) -> Void) {
        
        guard let parameters = requestModel.dictionary else { return }
        
        print(apiURL)
        print(parameters.convertToJSONString())
        NetworkService.shared.fetchData(requestType: .post, fromURL: apiURL, parameters: parameters) { (error:Error?, jsonData:Data?, statusCode:Int?) in
            if let err = error{
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)

                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let errr = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(errr))
                }
            }
        }
    }
    
    static func postWithTokenRequest(apiURL:String, requestModel:request,onCompletion: @escaping (Result<response,Error>) -> Void) {
        
        guard let parameters = requestModel.dictionary else { return }
        
        print(apiURL)
        print(parameters.convertToJSONString())
        
        NetworkService.shared.fetchDataWithToekn(requestType: .post, fromURL: apiURL, parameters: parameters) { (error:Error?, jsonData:Data?, statusCode:Int?) in
            if let err = error{
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)

                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let errr = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(errr))
                }
            }
        }
    }

}

class PostMultipartAPIGeneric<request: Codable,response: Codable> {
    
    static func fetchRequest(key:String? = nil, apiURL:String, media:[Media], requestModel:request, onCompletion: @escaping (Result<response,Error>) -> Void) {
        
        guard let parameters = requestModel.dictionary else { return }
        print(apiURL)
        print(parameters.convertToJSONString())
        NetworkService.shared.postRequest(fromURL: apiURL, media: media, parameters: parameters) { (error:Error?, jsonData:Data?, statusCode:Int?) in
            if let err = error{
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            }else{
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)

                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let errr = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(errr))
                }
            }
        }
    }

}

extension PostAPIGeneric {
    
    static func putRequest(apiURL: String, requestModel: request, onCompletion: @escaping (Result<response, Error>) -> Void) {
        guard let parameters = requestModel.dictionary else { return }
        
        print(apiURL)
        print(parameters.convertToJSONString())
        
        NetworkService.shared.fetchUpdateData(requestType: .put, fromURL: apiURL, parameters: parameters) { (error: Error?, jsonData: Data?, statusCode: Int?) in
            
            if let err = error {
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            } else {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)
                    
                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let errr = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(errr))
                }
            }
        }
    }
    
    
    static func putWithTokenRequest(apiURL: String, requestModel: request, onCompletion: @escaping (Result<response, Error>) -> Void) {
        guard let parameters = requestModel.dictionary else { return }
        
        print(apiURL)
        print(parameters.convertToJSONString())
        
        NetworkService.shared.fetchPutData(requestType: .put, fromURL: apiURL, parameters: parameters) { (error: Error?, jsonData: Data?, statusCode: Int?) in
            
            if let err = error {
                let errr = CustomError(description: err.localizedDescription)
                onCompletion(.failure(errr))
            } else {
                do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: jsonData!, options: [])
                    print(jsonResponse)
                    
                    if statusCode == 200 {
                        let responseModel = try JSONDecoder().decode(response.self, from: jsonData!)
                        onCompletion(.success(responseModel))
                    } else {
                        let responseModel = try JSONDecoder().decode(NotSuccessModel.self, from: jsonData!)
                        let error = CustomError(description: responseModel.message ?? "")
                        onCompletion(.failure(error))
                    }
                } catch let error {
                    let errr = CustomError(description: error.localizedDescription)
                    onCompletion(.failure(errr))
                }
            }
        }
    }
}
