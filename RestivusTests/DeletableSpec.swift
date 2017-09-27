//
//  DeletableSpec.swift
//  Restivus
//
//  Created by Ryan Baldwin on 2017-08-25.
//Copyright © 2017 bunnyhug.me. All rights governed under the Apache 2 License Agreement
//

import Quick
import Nimble
@testable import Restivus

struct DeletePersonRequest: Authenticating, Deletable {
    typealias ResponseType = Person
    var path = "/"
}

struct EncodableDeletePersonRequest: Encodable {
    var personId: String
}
extension EncodableDeletePersonRequest: Deletable {
    typealias ResponseType = Person
    var path: String { return "/" }
}

class DeletableSpec: QuickSpec {
    override func spec() {
        describe("A default Deletable") {
            var context: [String: Any]!
            
            beforeEach {
                context = ["method": HTTPMethod.delete,
                           "restable": AnyRestable<Person>(DeletePersonRequest()),
                           "encodable": AnyRestable<Person>(EncodableDeletePersonRequest(personId: "123"))]
            }
            
            itBehavesLike("a Restable") { context }
        }
    }
}
