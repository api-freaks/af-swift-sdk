import Foundation

public enum VatRateByCountryRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}