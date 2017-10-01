//
//  Puttable.swift
//  Restivus
//
//  Created by Ryan Baldwin on 2017-08-21.
//  Copyright © 2017 bunnyhug.me. All rights governed under the Apache 2 License Agreement
//

import Foundation

/// Designates the conforming type as a PUT HTTP Request.
public protocol Puttable: Restable {}

extension Puttable {
    
    /// Creates a POST request for the current instance
    ///
    /// - Returns: The URLRequest
    /// - Throws: An HTTPMethodError when the attempt to make the URLRequest failed.
    public func request() throws -> URLRequest {
        return try HTTPMethod.put.makeURLRequest(for: self)
    }
}

extension Puttable where Self: Encodable {

    /// Creates a POST request for the current Encodable instance,
    /// and encodes itself into the HTTP body of the request.
    ///
    /// - Returns: The URLRequest
    /// - Throws: An HTTPMethodError when the attempt to make the URLRequest failed.
    public func request() throws -> URLRequest {
        return try HTTPMethod.put.makeURLRequest(for: self)
    }
}
