//
//  SegmentationFault11.swift
//  SegmentationFault11
//
//  Created by Lukasz Marcin Margielewski on 25/11/2016.
//  Copyright © 2016 Lukasz Marcin Margielewski. All rights reserved.
//

import Foundation

class SegmentationFault11 {

    let responseProcessor = NetworkResponseProcessor() // Objective-C class
    let url = URL(string: "https://example.com")!

    func epicFail() {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {

                // !!!! SUCCES !!!! = All compiles now!
                // !!!! See diff of `NetworkResponseProcessor.h` file for an answer.
                _ = try self.responseProcessor.process(data)
                _ = try self.responseProcessor.process(response, data: data)
                _ = try self.responseProcessor.process(response, data: data, networkError: error)

                guard let networkResponse1 = NetworkResponse(urlResponse: response, data: data, networkError: error) else { return }
                guard let networkResponse2 = NetworkResponse(urlResponse: response, data: data) else { return }
                guard let networkResponse3 = NetworkResponse(urlResponse: response) else { return }
                guard let networkResponse4 = NetworkResponse(data: data) else { return }

                _ = try self.responseProcessor.processNetworkResponse(networkResponse1)
                _ = try self.responseProcessor.processNetworkResponse(networkResponse2)
                _ = try self.responseProcessor.processNetworkResponse(networkResponse3)
                _ = try self.responseProcessor.processNetworkResponse(networkResponse4)

            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
