import Foundation

public enum ScreenshotCaptureRequestOutput: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case image
}