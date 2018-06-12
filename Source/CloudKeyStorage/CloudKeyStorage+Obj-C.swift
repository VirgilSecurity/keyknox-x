//
// Copyright (C) 2015-2018 Virgil Security Inc.
//
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
//
//     (1) Redistributions of source code must retain the above copyright
//     notice, this list of conditions and the following disclaimer.
//
//     (2) Redistributions in binary form must reproduce the above copyright
//     notice, this list of conditions and the following disclaimer in
//     the documentation and/or other materials provided with the
//     distribution.
//
//     (3) Neither the name of the copyright holder nor the names of its
//     contributors may be used to endorse or promote products derived from
//     this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE AUTHOR ''AS IS'' AND ANY EXPRESS OR
// IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
// WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
// DISCLAIMED. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY DIRECT,
// INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
// (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
// SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
// HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING
// IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
// POSSIBILITY OF SUCH DAMAGE.
//
// Lead Maintainer: Virgil Security Inc. <support@virgilsecurity.com>
//

import Foundation
import VirgilCryptoApiImpl

@objc(VSKKeyEntry) public final class KeyEntry: NSObject {
    @objc public let name: String
    @objc public let data: Data
    @objc public let meta: [String: String]?

    @objc public init(name: String, data: Data, meta: [String: String]? = nil) {
        self.name = name
        self.data = data
        self.meta = meta

        super.init()
    }
}

extension CloudKeyStorage {
    @objc open func retrieveCloudEntries(completion: @escaping (Error?) -> ()) {
        self.retrieveCloudEntries().start { _, error in
            completion(error)
        }
    }

    @objc open func storeEntries(_ keyEntries: [KeyEntry], completion: @escaping (Error?) -> ()) {
        self.storeEntries(keyEntries).start { _, error in
            completion(error)
        }
    }

    @objc open func storeEntry(withName name: String, data: Data, meta: [String: String]? = nil,
                               completion: @escaping (Error?) -> ()) {
        self.storeEntry(withName: name, data: data, meta: meta).start { _, error in
            completion(error)
        }
    }

    @objc open func deleteEntry(withName name: String, completion: @escaping (Error?) -> ()) {
        self.deleteEntry(withName: name).start { _, error in
            completion(error)
        }
    }

    @objc open func deleteEntries(withNames names: [String], completion: @escaping (Error?) -> ()) {
        self.deleteEntries(withNames: names).start { _, error in
            completion(error)
        }
    }

    @objc open func deleteAllEntries(completion: @escaping (Error?) -> ()) {
        self.deleteAllEntries().start { _, error in
            completion(error)
        }
    }
}