//
//  NetworkingEndpointTests.swift
//  iOSTakeHomeProjectTests
//
//  Created by Samet Çağrı Aktepe on 8.12.2023.
//

import XCTest
@testable import iOSTakeHomeProject

final class NetworkingEndpointTests: XCTestCase {

    func testWithPeopleEndPointRequestIsValid () {
        let endpoint = Endpoint.people(page: 1)
        
        XCTAssertEqual(endpoint.host, "reqres.in", "Host should be reqres.in")
        XCTAssertEqual(endpoint.path, "/api/users", "Path should be /api/users")
        XCTAssertEqual(endpoint.methodType, .GET, "Method type should be GET")
        XCTAssertEqual(endpoint.queryItems, ["page" : "1"], "Query items should be page: 1")
        XCTAssertEqual(endpoint.url?.absoluteString, "https://reqres.in/api/users?page=1&delay=2", "The generated doesn't match the expected URL")
    }
    
    func testWithDetailEndPointRequestIsValid () {
        let userId = 1
        let endpoint = Endpoint.detail(id: userId)
        
        XCTAssertEqual(endpoint.host, "reqres.in", "Host should be reqres.in")
        XCTAssertEqual(endpoint.path, "/api/users/\(userId)", "Path should be /api/users/\(userId)")
        XCTAssertEqual(endpoint.methodType, .GET, "Method type should be GET")
        XCTAssertNil(endpoint.queryItems, "Query items should be nil")
        XCTAssertEqual(endpoint.url?.absoluteString, "https://reqres.in/api/users/\(userId)?delay=2", "The generated doesn't match the expected URL")
    }
    
    func testWithCreateEndPointRequestIsValid () {
        let endpoint = Endpoint.create(submissionData: nil)
        
        XCTAssertEqual(endpoint.host, "reqres.in", "Host should be reqres.in")
        XCTAssertEqual(endpoint.path, "/api/users", "Path should be /api/users")
        XCTAssertEqual(endpoint.methodType, .POST(data: nil), "Method type should be POST")
        XCTAssertNil(endpoint.queryItems, "Query items should be nil")
        XCTAssertEqual(endpoint.url?.absoluteString, "https://reqres.in/api/users?delay=2", "The generated doesn't match the expected URL")
    }

}
