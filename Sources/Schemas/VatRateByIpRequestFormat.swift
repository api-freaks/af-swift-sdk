import Foundation

public enum VatRateByIpRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}