import Foundation

public enum VatSupportedCountriesRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case iban = "IBAN"
    case swift = "SWIFT"
    case vat = "VAT"
}