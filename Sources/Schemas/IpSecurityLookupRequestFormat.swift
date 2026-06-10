import Foundation

public enum IpSecurityLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}