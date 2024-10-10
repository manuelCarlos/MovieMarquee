//
//  MediaTypeProtocol.swift
//  NetworkService
//
//  Created by Manuel Lopes on 08.10.24.
//

public protocol MediaTypeProtocol: NetworkRequest {
    var mediaType: MediaType { get }
}
