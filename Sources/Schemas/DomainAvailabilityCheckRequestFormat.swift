import Foundation

public enum DomainAvailabilityCheckRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}