import Foundation

public enum VatSupportedCountriesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}