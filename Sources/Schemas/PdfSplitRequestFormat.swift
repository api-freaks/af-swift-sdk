import Foundation

public enum PdfSplitRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}