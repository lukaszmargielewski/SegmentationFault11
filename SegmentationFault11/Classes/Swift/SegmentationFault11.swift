//
//  SegmentationFault11.swift
//  SegmentationFault11
//
//  Created by Lukasz Marcin Margielewski on 25/11/2016.
//  Copyright © 2016 Lukasz Marcin Margielewski. All rights reserved.
//

import Foundation

class SegmentationFault11 {

    let responseProcessor = NetworkResponseProcessor()
    let url = URL(string: "https://example.com")!

    func epicFail() {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            do {

                // !!!! SUCCES !!!!
                // ONLY This line compiles:
                // Notice 1 argument:
                _ = try self.responseProcessor.process(data)

                // This line causes compilation error: "Command failed due to signal: Segmentation fault: 11"
                // Notice 2 arguments:
                // _ = try self.responseProcessor.process(response, data: data)

                // This line causes compilation error: "Command failed due to signal: Segmentation fault: 11"
                // Notice 3 arguments:
                // _ = try self.responseProcessor.process(response, data: data, networkError: error)

                guard let networkResponse1 = NetworkResponse(urlResponse: response, data: data, networkError: error) else {
                    return
                }
                // This line causes compilation error: "Command failed due to signal: Segmentation fault: 11"
                // Notice, that this time fault happens even with 1 argument:
                // _ = try self.responseProcessor.processNetworkResponse(networkResponse1)

                guard let networkResponse2 = NetworkResponse(urlResponse: response, data: data) else {
                    return
                }
                // This line causes compilation error:
                // "Command failed due to signal: Segmentation fault: 11"
                // Notice, that this time fault happens even with 1 argument:
                // _ = try self.responseProcessor.processNetworkResponse(networkResponse2)

                guard let networkResponse3 = NetworkResponse(urlResponse: response) else {
                    return
                }
                // This line causes compilation error:
                // "Command failed due to signal: Segmentation fault: 11"
                // Notice, that this time fault happens even with 1 argument:
                // _ = try self.responseProcessor.processNetworkResponse(networkResponse3)

                guard let networkResponse4 = NetworkResponse(data: data) else {
                    return
                }
                // This line causes compilation error:
                // "Command failed due to signal: Segmentation fault: 11"
                // Notice, that this time fault happens even with 1 argument:
                // _ = try self.responseProcessor.processNetworkResponse(networkResponse4)


                // Just to silence warnings:
                networkResponse1.silenceWarning()
                networkResponse2.silenceWarning()
                networkResponse3.silenceWarning()
                networkResponse4.silenceWarning()

            } catch {
                print("Error: \(error)")
            }
        }.resume()
    }
}
