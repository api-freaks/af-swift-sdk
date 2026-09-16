import Foundation

public enum DomainReputationRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}