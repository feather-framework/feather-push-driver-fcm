//
//  File.swift
//
//
//  Created by Tibor Bodecs on 19/11/2023.
//

extension Array {

    func chunked(batchSize size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size)
            .map {
                Array(self[$0..<Swift.min($0 + size, count)])
            }
    }
}
