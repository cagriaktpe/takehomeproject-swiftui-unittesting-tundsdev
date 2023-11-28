//
//  JsonMapperTests.swift
//  iOSTakeHomeProjectTests
//
//  Created by Samet Çağrı Aktepe on 28.11.2023.
//

import XCTest

@testable import iOSTakeHomeProject

class JsonMapperTests: XCTestCase {
    
    func test_with_valid_json_successfully_decode() {
       XCTAssertNoThrow(try StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self), "Mapper should not throw error")
        
        let userResponse = try? StaticJSONMapper.decode(file: "UsersStaticData", type: UsersResponse.self)
        
        XCTAssertNotNil(userResponse, "User response should not be nil")
        
        XCTAssertEqual(userResponse?.page, 1, "Page should be 1")
        XCTAssertEqual(userResponse?.perPage, 6, "Per page should be 6")
        XCTAssertEqual(userResponse?.total, 12, "Total should be 12")
        XCTAssertEqual(userResponse?.totalPages, 2, "Total pages should be 2")
        
        XCTAssertEqual(userResponse?.data.count, 6, "Data count should be 6")
        
        // first user
        XCTAssertEqual(userResponse?.data[0].id, 1, "Id should be 1")
        XCTAssertEqual(userResponse?.data[0].email, "george.bluth@reqres.in", "Email should be george.bluth@reqres.in")
        XCTAssertEqual(userResponse?.data[0].firstName, "George", "First name should be George")
        XCTAssertEqual(userResponse?.data[0].lastName, "Bluth", "Last name should be Bluth")
        XCTAssertEqual(userResponse?.data[0].avatar, "https://reqres.in/img/faces/1-image.jpg", "Avatar should be https://reqres.in/img/faces/1-image.jpg")
        
        // second user
        XCTAssertEqual(userResponse?.data[1].id, 2, "Id should be 2")
        XCTAssertEqual(userResponse?.data[1].email, "janet.weaver@reqres.in", "Email should be janet.weaver@reqres.in")
        XCTAssertEqual(userResponse?.data[1].firstName, "Janet", "First name should be Janet")
        XCTAssertEqual(userResponse?.data[1].lastName, "Weaver", "Last name should be Weaver")
        XCTAssertEqual(userResponse?.data[1].avatar, "https://reqres.in/img/faces/2-image.jpg", "Avatar should be https://reqres.in/img/faces/2-image.jpg")
        
        // third user
        XCTAssertEqual(userResponse?.data[2].id, 3, "Id should be 3")
        XCTAssertEqual(userResponse?.data[2].email, "emma.wong@reqres.in")
        XCTAssertEqual(userResponse?.data[2].firstName, "Emma")
        XCTAssertEqual(userResponse?.data[2].lastName, "Wong")
        XCTAssertEqual(userResponse?.data[2].avatar, "https://reqres.in/img/faces/3-image.jpg")
        
        // fourth user
        XCTAssertEqual(userResponse?.data[3].id, 4, "Id should be 4")
        XCTAssertEqual(userResponse?.data[3].email, "eve.holt@reqres.in", "Email should be eve.holt@reqres.in")
        XCTAssertEqual(userResponse?.data[3].firstName, "Eve", "First name should be Eve")
        XCTAssertEqual(userResponse?.data[3].lastName, "Holt", "Last name should be Holt")
        
        // fifth user
        XCTAssertEqual(userResponse?.data[4].id, 5, "Id should be 5")
        XCTAssertEqual(userResponse?.data[4].email, "charles.morris@reqres.in", "Email should be charles.morris@reqres.in")
        XCTAssertEqual(userResponse?.data[4].firstName, "Charles", "First name should be Charles")
        XCTAssertEqual(userResponse?.data[4].lastName, "Morris", "Last name should be Morris")
        XCTAssertEqual(userResponse?.data[4].avatar, "https://reqres.in/img/faces/5-image.jpg", "Avatar should be https://reqres.in/img/faces/5-image.jpg")
        
        // sixth user
        XCTAssertEqual(userResponse?.data[5].id, 6, "Id should be 6")
        XCTAssertEqual(userResponse?.data[5].email, "tracey.ramos@reqres.in", "Email should be tracey.ramos@reqres.in")
        XCTAssertEqual(userResponse?.data[5].firstName, "Tracey", "First name should be Tracey")
        XCTAssertEqual(userResponse?.data[5].lastName, "Ramos", "Last name should be Ramos")
        XCTAssertEqual(userResponse?.data[5].avatar, "https://reqres.in/img/faces/6-image.jpg", "Avatar should be https://reqres.in/img/faces/6-image.jpg")
                       
    }
    
    func test_with_missing_file_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "", type: UsersResponse.self), "An error should be throw")
        do {
            _ = try StaticJSONMapper.decode(file: "", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be the error type for missing files")
        }
    }
    
    func test_with_invalid_file_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "dfd", type: UsersResponse.self), "An error should be throw")
        do {
            _ = try StaticJSONMapper.decode(file: "dfddf", type: UsersResponse.self)
        } catch {
            guard let mappingError = error as? StaticJSONMapper.MappingError else {
                XCTFail("This is the wrong type of error for missing files")
                return
            }
            XCTAssertEqual(mappingError, StaticJSONMapper.MappingError.failedToGetContents, "This should be the error type for missing files")
        }
    }
    
    func test_with_invalid_json_error_thrown() {
        XCTAssertThrowsError(try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self), "An error should be throw")
        
        do {
            _ = try StaticJSONMapper.decode(file: "UsersStaticData", type: UserDetailResponse.self)
        } catch {
            if error is StaticJSONMapper.MappingError {
                XCTFail("This is the wrong type of error for invalid json")
            }
        }
    }
}
