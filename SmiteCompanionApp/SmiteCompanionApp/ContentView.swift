//
//  ContentView.swift
//  SmiteCompanionApp
//
//  Created by Michael DiGregorio on 1/12/22.
//

import SwiftUI
import CoreData
import Foundation
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG

struct GodList {
    let id = UUID()
}

struct SessionInformation: Hashable, Codable {
    let ret_msg: String
    let session_id: String
    let timestamp: String
}

class SmiteAPIHandler {

    let apiURLBase: String = "https://api.smitegame.com/smiteapi.svc"
    let requestedType: String = "json"
    let devid: String = "3728"
    let authKey: String = "D0A817B8F36648388B7D9F014CB0C537"
    @State var sessionID: String = ""
    
    func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)

        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    
    func getSignature(endpoint: String) -> (signature: String, time: String){
        let time = Date().getFormattedDate()
        let hashable: String = devid + endpoint + authKey + time
        return (MD5(string: hashable).map { String(format: "%02hhx", $0) }.joined(), time)
    }
    
    func buildAPIBase(endpoint: String, sessionID: String) -> String {
        let sigtime = getSignature(endpoint: endpoint)
        
        return [
            apiURLBase,
            endpoint+requestedType,
            devid,
            sigtime.signature,
            sessionID,
            sigtime.time
        ]
            .joined(separator: "/")
    }
    
    func createSession() {
        // request
        let sigtime = getSignature(endpoint: "createsession")
        guard let url = URL(
            string: [apiURLBase, "createsession", devid, sigtime.signature, sigtime.time].joined(separator: "/")
        ) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self]
            data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let sessionInfo = try JSONDecoder().decode(SessionInformation.self, from: data)
                DispatchQueue.main.async {
                    self?.sessionID = sessionInfo.session_id
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}

extension Date  {
    func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"

        return dateFormatter.string(from: self)
    }
}

struct ContentView: View {
    
    let SmiteAPIHanlder = SmiteAPIHandler(

    )
    
    var sessionID: String {
        SmiteAPIHanlder.sessionID
    }

    var body: some View {
        NavigationView {
            Form {
                List {
                    
                }
                .navigationTitle("Gods")
                .onAppear {
                    // SmiteAPI.fetch()
            }
        }
    }
}

struct ContentView_Preview: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
