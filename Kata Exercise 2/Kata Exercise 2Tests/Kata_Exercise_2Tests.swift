
import XCTest

@testable import Kata_Exercise_2

class Kata_Exercise_2Tests: XCTestCase {
    var mockCalculator: CalculateTax?
    override func setUp() {
        
        mockCalculator = CalculateTax()
    }

    override func tearDown() {
        
        mockCalculator = nil
    }
    
    func testCalculateTotal() {
        let totalAmount = mockCalculator?.calculateTotal("test", 5, 10.2)
        XCTAssertEqual(totalAmount, 51.0)
    }
    
    func testDiscountTotal() {
        guard let totalAmount = mockCalculator?.calculateTotal("test", 5, 10000) else { return }
        let discount = mockCalculator?.discountCalculation(totalAmount)
        XCTAssertEqual(discount, (42500.0))
    }
    
    func testCalculateTaxAmount() {
        let taxAmount = mockCalculator?.taxCalculation("bike", 3, 4500.0, USState.WA)
        XCTAssertEqual(taxAmount, 1204.2)
    }
    
    
    }

