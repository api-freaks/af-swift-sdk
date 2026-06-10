import Foundation

public enum ScreenshotCaptureRequestFileType: String, Codable, Hashable, CaseIterable, Sendable {
    case png = "PNG"
    case jpeg = "JPEG"
    case webp = "WEBP"
    case pdf = "PDF"
    case mp4
    case gif
    case webm
}