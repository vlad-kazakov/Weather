//
//  MapCollectionToArray.swift
//  Weather
//
//  Created by Kazakov Vladyslav on 09.08.2022.
//

import Foundation

public extension LazyMapCollection  {

    func toArray() -> [Element]{
        return Array(self)
    }
}
