import Foundation

public enum IpWhoisLookupRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}