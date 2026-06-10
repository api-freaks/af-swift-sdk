import Foundation

public enum BulkVatRateByCountryRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}