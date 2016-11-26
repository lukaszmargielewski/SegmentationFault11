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
                _ = try self.responseProcessor.process(response, data: data, networkError: error)
            } catch {}
        }.resume()
    }
}
