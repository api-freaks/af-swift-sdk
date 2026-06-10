import Foundation

public enum PdfUploadResourcesRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}