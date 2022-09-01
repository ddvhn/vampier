//
//  Types.swift
//  Vampier
//
//  Created by Den on 08.10.2020.
//

import Foundation

// MARK: - Closures

public typealias ErrorClosure<T: Error> = (T?) -> Void
public typealias ResultClosure<T, E: Error> = (Result<T, E>) -> Void
public typealias VoidClosure = () -> Void


// MARK: - Result<T, E>

public enum Result<T, E> {

    case success(_ result: T)
    case failure(_ error: E)
}

public extension Result {

    var value: T? {
        switch self {
        case .success(let value): return value
        default: return nil
        }
    }

    var error: E? {
        switch self {
        case .failure(let error): return error
        default: return nil
        }
    }
}
