/**
 * Copyright IBM Corporation 2015
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

/**
 
 **Feeds**
 
 Response object for **Feed** related calls
 
 */

public struct Feeds {
    
    /** the number of transactions made by the call */
    public let totalTransactions: Int?
    
    /** extracted language */
    public let language: String?
    
    /** the URL information was requested for */
    public let url: String?
    
    /** see **Feed** */
    public let feeds: [Feed]?
    
    /// Used internally to initialize a Feeds object
    public init(json: JSON) {
        if let totalTransactionString = json["totalTransactions"].string {
            totalTransactions = Int(totalTransactionString)
        } else {
            totalTransactions = 1
        }
        language = json["language"].string
        url = json["url"].string
        feeds = json["feeds"].arrayValue.map(Feed.init)
    }
}

