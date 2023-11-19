//
//  File.swift
//
//
//  Created by Tibor Bodecs on 19/11/2023.
//

import Foundation
@testable import FCM
import XCTest

final class ChunkedTests: XCTestCase {

    func testChunks() {
        let array1 = [1, 2, 3, 4, 5, 6, 7, 8, 9]
        let res1 = array1.chunked(batchSize: 5)
        XCTAssertEqual(res1, [[1, 2, 3, 4, 5], [6, 7, 8, 9]])

        let array2 = [1, 2]
        let res2 = array2.chunked(batchSize: 5)
        XCTAssertEqual(res2, [[1, 2]])
    }
}
