import Foundation

public enum PdfGetTaskStatusRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}