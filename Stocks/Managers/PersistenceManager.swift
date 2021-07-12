//
//  PersistenceManager.swift
//  Stocks
//
//  Created by Amit Biswas on 7/9/21.
//

import Foundation

final class PersistenceManager {
    static let shared = PersistenceManager()
    private init () {}

    private let userDefaults: UserDefaults = .standard

    private struct Constants {

    }

    //MARK:- Private
    private var hasOnboarded: Bool {
        return false
    }

    //MARK:- Public

    public var watchList: [String] {
        return []
    }

    public func addToWatchList() {

    }

    public func removeFromWatchList() {

    }
}
