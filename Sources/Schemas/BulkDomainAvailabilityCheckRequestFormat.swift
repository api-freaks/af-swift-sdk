import Foundation

public enum BulkDomainAvailabilityCheckRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}