import Foundation

/// Output format. PNG (lossless, transparency), JPEG (compressed, smaller size), WebP (modern, efficient), PDF (document). For scrolling captures: MP4, GIF, WebM. Scrolling capture formats: WEBM (web-optimized), MP4 (widely compatible, default), GIF (short loops).
public enum BulkScreenshotCaptureRequestUrlsItemFileType: String, Codable, Hashable, CaseIterable, Sendable {
    case png = "PNG"
    case jpeg = "JPEG"
    case webp = "WEBP"
    case pdf = "PDF"
    case mp4 = "MP4"
    case gif = "GIF"
    case webm = "WEBM"
}