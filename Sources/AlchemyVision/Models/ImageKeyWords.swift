/**
 * Copyright IBM Corporation 2016
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 **/

import Foundation
import SwiftyJSON

/** A set of keywords for an image analyzed by the Alchemy Vision service. */
public struct ImageKeywords {
    
    /// The status of the request.
    public let status: String
    
    /// The URL of the requested image being tagged.
    public let url: String
    
    /// The number of transactions charged for this request.
    public let totalTransactions: Int
    
    /// Keywords for the given image.
    public let imageKeywords: [ImageKeyword]
    
    /// Used internally to initialize an `ImageKeywords` model from JSON.
    public init(json: JSON) {
        status = json["status"].stringValue
        url = json["url"].stringValue
        totalTransactions = json["totalTransactions"].intValue
        
        var imageKeywords: [ImageKeyword] = []
        for value in json["imageKeywords"].arrayValue {
            imageKeywords.insert(ImageKeyword(json: value), at: 0)
        }
        self.imageKeywords = imageKeywords
    }
}

/** A keyword for the given image. */
public struct ImageKeyword {

    /// A keyword that is associated with the specified image.
    public let text: String

    /// The likelihood that this keyword corresponds to the image.
    public let score: Double
    
    /// Metadata derived from the Alchemy knowledge graph.
    public let knowledgeGraph: KnowledgeGraph?

    /// Used internally to initialize an `ImageKeyword` model from JSON.
    public init(json: JSON) {
        text = json["text"].stringValue
        score = json["score"].doubleValue
        knowledgeGraph = KnowledgeGraph(json: json["knowledgeGraph"])
    }
}