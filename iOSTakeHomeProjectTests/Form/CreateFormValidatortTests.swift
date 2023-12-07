//
//  CreateFormValidatortTests.swift
//  iOSTakeHomeProjectTests
//
//  Created by Samet Çağrı Aktepe on 2.12.2023.
//

import XCTest
@testable import iOSTakeHomeProject

final class CreateFormValidatortTests: XCTestCase {
    
    private var validator: CreateValidator!
    
    override func setUp() {
        validator = CreateValidator()
    }
    
    override func tearDown() {
        validator = nil
    }
    
    func test_with_empty_person_first_name_error_thrown() {
        let person = NewPerson()
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty first name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Got the wrong type of error expecting a create validator error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidFirstName, "Error should be invalid first name")
        }
    }
    
    func test_with_empty_first_name_error_thrown() {
        let person = NewPerson(lastName: "Last name", job: "Job")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty first name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Got the wrong type of error expecting a create validator error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidFirstName, "Error should be invalid first name")
        }
    }
    
    func test_with_empty_last_name_error_thrown() {
        let person = NewPerson(firstName: "First name", job: "Job")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty last name should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Got the wrong type of error expecting a create validator error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidLastName, "Error should be invalid last name")
        }
    }
    
    func test_with_empty_job_error_thrown() {
        let person = NewPerson(firstName: "First name", lastName: "Last name")
        
        XCTAssertThrowsError(try validator.validate(person), "Error for an empty job should be thrown")
        
        do {
            _ = try validator.validate(person)
        } catch {
            guard let validationError = error as? CreateValidator.CreateValidatorError else {
                XCTFail("Got the wrong type of error expecting a create validator error")
                return
            }
            
            XCTAssertEqual(validationError, CreateValidator.CreateValidatorError.invalidJob, "Error should be invalid job")
        }
    }
    
    func test_with_valid_person_error_not_thrown() {
        let person = NewPerson(firstName: "First name", lastName: "Last name", job: "Job")
        
        do {
            _ = try validator.validate(person)
        } catch {
            XCTFail("Error should not be thrown")
        }
    }
}
