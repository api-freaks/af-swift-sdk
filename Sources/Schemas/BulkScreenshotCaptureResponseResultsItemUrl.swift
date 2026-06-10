import Foundation

public struct BulkScreenshotCaptureResponseResultsItemUrl: Codable, Hashable, Sendable {
    public let screenshot: String
    public let url: String
    public let createdAt: String
    public let format: String
    public let ttl: String
    public let fileType: String?
    public let extractedHtml: String?
    public let omitBackground: Bool?
    public let destroyScreenshot: Bool?
    public let failOnError: Bool?
    public let longitude: Double?
    public let latitude: Double?
    public let proxy: String?
    public let noCookieBanners: Bool?
    public let blockAds: Bool?
    public let headers: String?
    public let cookies: String?
    public let scrollToElement: String?
    public let selector: String?
    public let blurSelector: String?
    public let removeSelector: String?
    public let css: String?
    public let cssUrl: String?
    public let js: String?
    public let jsUrl: String?
    public let userAgent: String?
    public let acceptLanguages: String?
    public let delay: Double?
    public let thumbnailWidth: Double?
    public let output: String?
    public let fresh: Bool?
    public let enableCaching: Bool?
    public let lazyLoad: Bool?
    public let fullPage: Bool?
    public let retina: Bool?
    public let height: Double?
    public let width: Double?
    public let customHtml: String?
    public let blockChatWidgets: Bool?
    public let blockJs: Bool?
    public let blockStylesheets: Bool?
    public let blockImages: Bool?
    public let blockMedia: Bool?
    public let blockFont: Bool?
    public let blockTextTrack: Bool?
    public let blockXhr: Bool?
    public let blockFetch: Bool?
    public let blockEventSource: Bool?
    public let blockWebSocket: Bool?
    public let blockManifest: Bool?
    public let blockSpecificRequests: String?
    public let adjustTop: Double?
    public let imageQuality: Double?
    public let extractHtml: Bool?
    public let extractText: Bool?
    public let darkMode: Bool?
    public let blockTracking: Bool?
    public let waitForEvent: String?
    public let grayscale: Double?
    public let resultFileName: String?
    public let enableIncognito: Bool?
    public let timeout: Double?
    public let scrollingScreenshot: Bool?
    public let multipleScrolling: Bool?
    public let scrollSpeed: String?
    public let duration: Double?
    public let scrollBack: Bool?
    public let startImmediately: Bool?
    public let clip: [String: JSONValue]?
    public let sizes: [[String: JSONValue]]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        screenshot: String,
        url: String,
        createdAt: String,
        format: String,
        ttl: String,
        fileType: String? = nil,
        extractedHtml: String? = nil,
        omitBackground: Bool? = nil,
        destroyScreenshot: Bool? = nil,
        failOnError: Bool? = nil,
        longitude: Double? = nil,
        latitude: Double? = nil,
        proxy: String? = nil,
        noCookieBanners: Bool? = nil,
        blockAds: Bool? = nil,
        headers: String? = nil,
        cookies: String? = nil,
        scrollToElement: String? = nil,
        selector: String? = nil,
        blurSelector: String? = nil,
        removeSelector: String? = nil,
        css: String? = nil,
        cssUrl: String? = nil,
        js: String? = nil,
        jsUrl: String? = nil,
        userAgent: String? = nil,
        acceptLanguages: String? = nil,
        delay: Double? = nil,
        thumbnailWidth: Double? = nil,
        output: String? = nil,
        fresh: Bool? = nil,
        enableCaching: Bool? = nil,
        lazyLoad: Bool? = nil,
        fullPage: Bool? = nil,
        retina: Bool? = nil,
        height: Double? = nil,
        width: Double? = nil,
        customHtml: String? = nil,
        blockChatWidgets: Bool? = nil,
        blockJs: Bool? = nil,
        blockStylesheets: Bool? = nil,
        blockImages: Bool? = nil,
        blockMedia: Bool? = nil,
        blockFont: Bool? = nil,
        blockTextTrack: Bool? = nil,
        blockXhr: Bool? = nil,
        blockFetch: Bool? = nil,
        blockEventSource: Bool? = nil,
        blockWebSocket: Bool? = nil,
        blockManifest: Bool? = nil,
        blockSpecificRequests: String? = nil,
        adjustTop: Double? = nil,
        imageQuality: Double? = nil,
        extractHtml: Bool? = nil,
        extractText: Bool? = nil,
        darkMode: Bool? = nil,
        blockTracking: Bool? = nil,
        waitForEvent: String? = nil,
        grayscale: Double? = nil,
        resultFileName: String? = nil,
        enableIncognito: Bool? = nil,
        timeout: Double? = nil,
        scrollingScreenshot: Bool? = nil,
        multipleScrolling: Bool? = nil,
        scrollSpeed: String? = nil,
        duration: Double? = nil,
        scrollBack: Bool? = nil,
        startImmediately: Bool? = nil,
        clip: [String: JSONValue]? = nil,
        sizes: [[String: JSONValue]]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.screenshot = screenshot
        self.url = url
        self.createdAt = createdAt
        self.format = format
        self.ttl = ttl
        self.fileType = fileType
        self.extractedHtml = extractedHtml
        self.omitBackground = omitBackground
        self.destroyScreenshot = destroyScreenshot
        self.failOnError = failOnError
        self.longitude = longitude
        self.latitude = latitude
        self.proxy = proxy
        self.noCookieBanners = noCookieBanners
        self.blockAds = blockAds
        self.headers = headers
        self.cookies = cookies
        self.scrollToElement = scrollToElement
        self.selector = selector
        self.blurSelector = blurSelector
        self.removeSelector = removeSelector
        self.css = css
        self.cssUrl = cssUrl
        self.js = js
        self.jsUrl = jsUrl
        self.userAgent = userAgent
        self.acceptLanguages = acceptLanguages
        self.delay = delay
        self.thumbnailWidth = thumbnailWidth
        self.output = output
        self.fresh = fresh
        self.enableCaching = enableCaching
        self.lazyLoad = lazyLoad
        self.fullPage = fullPage
        self.retina = retina
        self.height = height
        self.width = width
        self.customHtml = customHtml
        self.blockChatWidgets = blockChatWidgets
        self.blockJs = blockJs
        self.blockStylesheets = blockStylesheets
        self.blockImages = blockImages
        self.blockMedia = blockMedia
        self.blockFont = blockFont
        self.blockTextTrack = blockTextTrack
        self.blockXhr = blockXhr
        self.blockFetch = blockFetch
        self.blockEventSource = blockEventSource
        self.blockWebSocket = blockWebSocket
        self.blockManifest = blockManifest
        self.blockSpecificRequests = blockSpecificRequests
        self.adjustTop = adjustTop
        self.imageQuality = imageQuality
        self.extractHtml = extractHtml
        self.extractText = extractText
        self.darkMode = darkMode
        self.blockTracking = blockTracking
        self.waitForEvent = waitForEvent
        self.grayscale = grayscale
        self.resultFileName = resultFileName
        self.enableIncognito = enableIncognito
        self.timeout = timeout
        self.scrollingScreenshot = scrollingScreenshot
        self.multipleScrolling = multipleScrolling
        self.scrollSpeed = scrollSpeed
        self.duration = duration
        self.scrollBack = scrollBack
        self.startImmediately = startImmediately
        self.clip = clip
        self.sizes = sizes
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.screenshot = try container.decode(String.self, forKey: .screenshot)
        self.url = try container.decode(String.self, forKey: .url)
        self.createdAt = try container.decode(String.self, forKey: .createdAt)
        self.format = try container.decode(String.self, forKey: .format)
        self.ttl = try container.decode(String.self, forKey: .ttl)
        self.fileType = try container.decodeIfPresent(String.self, forKey: .fileType)
        self.extractedHtml = try container.decodeIfPresent(String.self, forKey: .extractedHtml)
        self.omitBackground = try container.decodeIfPresent(Bool.self, forKey: .omitBackground)
        self.destroyScreenshot = try container.decodeIfPresent(Bool.self, forKey: .destroyScreenshot)
        self.failOnError = try container.decodeIfPresent(Bool.self, forKey: .failOnError)
        self.longitude = try container.decodeIfPresent(Double.self, forKey: .longitude)
        self.latitude = try container.decodeIfPresent(Double.self, forKey: .latitude)
        self.proxy = try container.decodeIfPresent(String.self, forKey: .proxy)
        self.noCookieBanners = try container.decodeIfPresent(Bool.self, forKey: .noCookieBanners)
        self.blockAds = try container.decodeIfPresent(Bool.self, forKey: .blockAds)
        self.headers = try container.decodeIfPresent(String.self, forKey: .headers)
        self.cookies = try container.decodeIfPresent(String.self, forKey: .cookies)
        self.scrollToElement = try container.decodeIfPresent(String.self, forKey: .scrollToElement)
        self.selector = try container.decodeIfPresent(String.self, forKey: .selector)
        self.blurSelector = try container.decodeIfPresent(String.self, forKey: .blurSelector)
        self.removeSelector = try container.decodeIfPresent(String.self, forKey: .removeSelector)
        self.css = try container.decodeIfPresent(String.self, forKey: .css)
        self.cssUrl = try container.decodeIfPresent(String.self, forKey: .cssUrl)
        self.js = try container.decodeIfPresent(String.self, forKey: .js)
        self.jsUrl = try container.decodeIfPresent(String.self, forKey: .jsUrl)
        self.userAgent = try container.decodeIfPresent(String.self, forKey: .userAgent)
        self.acceptLanguages = try container.decodeIfPresent(String.self, forKey: .acceptLanguages)
        self.delay = try container.decodeIfPresent(Double.self, forKey: .delay)
        self.thumbnailWidth = try container.decodeIfPresent(Double.self, forKey: .thumbnailWidth)
        self.output = try container.decodeIfPresent(String.self, forKey: .output)
        self.fresh = try container.decodeIfPresent(Bool.self, forKey: .fresh)
        self.enableCaching = try container.decodeIfPresent(Bool.self, forKey: .enableCaching)
        self.lazyLoad = try container.decodeIfPresent(Bool.self, forKey: .lazyLoad)
        self.fullPage = try container.decodeIfPresent(Bool.self, forKey: .fullPage)
        self.retina = try container.decodeIfPresent(Bool.self, forKey: .retina)
        self.height = try container.decodeIfPresent(Double.self, forKey: .height)
        self.width = try container.decodeIfPresent(Double.self, forKey: .width)
        self.customHtml = try container.decodeIfPresent(String.self, forKey: .customHtml)
        self.blockChatWidgets = try container.decodeIfPresent(Bool.self, forKey: .blockChatWidgets)
        self.blockJs = try container.decodeIfPresent(Bool.self, forKey: .blockJs)
        self.blockStylesheets = try container.decodeIfPresent(Bool.self, forKey: .blockStylesheets)
        self.blockImages = try container.decodeIfPresent(Bool.self, forKey: .blockImages)
        self.blockMedia = try container.decodeIfPresent(Bool.self, forKey: .blockMedia)
        self.blockFont = try container.decodeIfPresent(Bool.self, forKey: .blockFont)
        self.blockTextTrack = try container.decodeIfPresent(Bool.self, forKey: .blockTextTrack)
        self.blockXhr = try container.decodeIfPresent(Bool.self, forKey: .blockXhr)
        self.blockFetch = try container.decodeIfPresent(Bool.self, forKey: .blockFetch)
        self.blockEventSource = try container.decodeIfPresent(Bool.self, forKey: .blockEventSource)
        self.blockWebSocket = try container.decodeIfPresent(Bool.self, forKey: .blockWebSocket)
        self.blockManifest = try container.decodeIfPresent(Bool.self, forKey: .blockManifest)
        self.blockSpecificRequests = try container.decodeIfPresent(String.self, forKey: .blockSpecificRequests)
        self.adjustTop = try container.decodeIfPresent(Double.self, forKey: .adjustTop)
        self.imageQuality = try container.decodeIfPresent(Double.self, forKey: .imageQuality)
        self.extractHtml = try container.decodeIfPresent(Bool.self, forKey: .extractHtml)
        self.extractText = try container.decodeIfPresent(Bool.self, forKey: .extractText)
        self.darkMode = try container.decodeIfPresent(Bool.self, forKey: .darkMode)
        self.blockTracking = try container.decodeIfPresent(Bool.self, forKey: .blockTracking)
        self.waitForEvent = try container.decodeIfPresent(String.self, forKey: .waitForEvent)
        self.grayscale = try container.decodeIfPresent(Double.self, forKey: .grayscale)
        self.resultFileName = try container.decodeIfPresent(String.self, forKey: .resultFileName)
        self.enableIncognito = try container.decodeIfPresent(Bool.self, forKey: .enableIncognito)
        self.timeout = try container.decodeIfPresent(Double.self, forKey: .timeout)
        self.scrollingScreenshot = try container.decodeIfPresent(Bool.self, forKey: .scrollingScreenshot)
        self.multipleScrolling = try container.decodeIfPresent(Bool.self, forKey: .multipleScrolling)
        self.scrollSpeed = try container.decodeIfPresent(String.self, forKey: .scrollSpeed)
        self.duration = try container.decodeIfPresent(Double.self, forKey: .duration)
        self.scrollBack = try container.decodeIfPresent(Bool.self, forKey: .scrollBack)
        self.startImmediately = try container.decodeIfPresent(Bool.self, forKey: .startImmediately)
        self.clip = try container.decodeIfPresent([String: JSONValue].self, forKey: .clip)
        self.sizes = try container.decodeIfPresent([[String: JSONValue]].self, forKey: .sizes)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.screenshot, forKey: .screenshot)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.createdAt, forKey: .createdAt)
        try container.encode(self.format, forKey: .format)
        try container.encode(self.ttl, forKey: .ttl)
        try container.encodeIfPresent(self.fileType, forKey: .fileType)
        try container.encodeIfPresent(self.extractedHtml, forKey: .extractedHtml)
        try container.encodeIfPresent(self.omitBackground, forKey: .omitBackground)
        try container.encodeIfPresent(self.destroyScreenshot, forKey: .destroyScreenshot)
        try container.encodeIfPresent(self.failOnError, forKey: .failOnError)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.proxy, forKey: .proxy)
        try container.encodeIfPresent(self.noCookieBanners, forKey: .noCookieBanners)
        try container.encodeIfPresent(self.blockAds, forKey: .blockAds)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.cookies, forKey: .cookies)
        try container.encodeIfPresent(self.scrollToElement, forKey: .scrollToElement)
        try container.encodeIfPresent(self.selector, forKey: .selector)
        try container.encodeIfPresent(self.blurSelector, forKey: .blurSelector)
        try container.encodeIfPresent(self.removeSelector, forKey: .removeSelector)
        try container.encodeIfPresent(self.css, forKey: .css)
        try container.encodeIfPresent(self.cssUrl, forKey: .cssUrl)
        try container.encodeIfPresent(self.js, forKey: .js)
        try container.encodeIfPresent(self.jsUrl, forKey: .jsUrl)
        try container.encodeIfPresent(self.userAgent, forKey: .userAgent)
        try container.encodeIfPresent(self.acceptLanguages, forKey: .acceptLanguages)
        try container.encodeIfPresent(self.delay, forKey: .delay)
        try container.encodeIfPresent(self.thumbnailWidth, forKey: .thumbnailWidth)
        try container.encodeIfPresent(self.output, forKey: .output)
        try container.encodeIfPresent(self.fresh, forKey: .fresh)
        try container.encodeIfPresent(self.enableCaching, forKey: .enableCaching)
        try container.encodeIfPresent(self.lazyLoad, forKey: .lazyLoad)
        try container.encodeIfPresent(self.fullPage, forKey: .fullPage)
        try container.encodeIfPresent(self.retina, forKey: .retina)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.width, forKey: .width)
        try container.encodeIfPresent(self.customHtml, forKey: .customHtml)
        try container.encodeIfPresent(self.blockChatWidgets, forKey: .blockChatWidgets)
        try container.encodeIfPresent(self.blockJs, forKey: .blockJs)
        try container.encodeIfPresent(self.blockStylesheets, forKey: .blockStylesheets)
        try container.encodeIfPresent(self.blockImages, forKey: .blockImages)
        try container.encodeIfPresent(self.blockMedia, forKey: .blockMedia)
        try container.encodeIfPresent(self.blockFont, forKey: .blockFont)
        try container.encodeIfPresent(self.blockTextTrack, forKey: .blockTextTrack)
        try container.encodeIfPresent(self.blockXhr, forKey: .blockXhr)
        try container.encodeIfPresent(self.blockFetch, forKey: .blockFetch)
        try container.encodeIfPresent(self.blockEventSource, forKey: .blockEventSource)
        try container.encodeIfPresent(self.blockWebSocket, forKey: .blockWebSocket)
        try container.encodeIfPresent(self.blockManifest, forKey: .blockManifest)
        try container.encodeIfPresent(self.blockSpecificRequests, forKey: .blockSpecificRequests)
        try container.encodeIfPresent(self.adjustTop, forKey: .adjustTop)
        try container.encodeIfPresent(self.imageQuality, forKey: .imageQuality)
        try container.encodeIfPresent(self.extractHtml, forKey: .extractHtml)
        try container.encodeIfPresent(self.extractText, forKey: .extractText)
        try container.encodeIfPresent(self.darkMode, forKey: .darkMode)
        try container.encodeIfPresent(self.blockTracking, forKey: .blockTracking)
        try container.encodeIfPresent(self.waitForEvent, forKey: .waitForEvent)
        try container.encodeIfPresent(self.grayscale, forKey: .grayscale)
        try container.encodeIfPresent(self.resultFileName, forKey: .resultFileName)
        try container.encodeIfPresent(self.enableIncognito, forKey: .enableIncognito)
        try container.encodeIfPresent(self.timeout, forKey: .timeout)
        try container.encodeIfPresent(self.scrollingScreenshot, forKey: .scrollingScreenshot)
        try container.encodeIfPresent(self.multipleScrolling, forKey: .multipleScrolling)
        try container.encodeIfPresent(self.scrollSpeed, forKey: .scrollSpeed)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.scrollBack, forKey: .scrollBack)
        try container.encodeIfPresent(self.startImmediately, forKey: .startImmediately)
        try container.encodeIfPresent(self.clip, forKey: .clip)
        try container.encodeIfPresent(self.sizes, forKey: .sizes)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case screenshot
        case url
        case createdAt = "created_at"
        case format
        case ttl
        case fileType = "file_type"
        case extractedHtml = "extracted_html"
        case omitBackground = "omit_background"
        case destroyScreenshot = "destroy_screenshot"
        case failOnError = "fail_on_error"
        case longitude
        case latitude
        case proxy
        case noCookieBanners = "no_cookie_banners"
        case blockAds = "block_ads"
        case headers
        case cookies
        case scrollToElement = "scroll_to_element"
        case selector
        case blurSelector = "blur_selector"
        case removeSelector = "remove_selector"
        case css
        case cssUrl = "css_url"
        case js
        case jsUrl = "js_url"
        case userAgent = "user_agent"
        case acceptLanguages = "accept_languages"
        case delay
        case thumbnailWidth = "thumbnail_width"
        case output
        case fresh
        case enableCaching = "enable_caching"
        case lazyLoad = "lazy_load"
        case fullPage = "full_page"
        case retina
        case height
        case width
        case customHtml = "custom_html"
        case blockChatWidgets = "block_chat_widgets"
        case blockJs = "block_js"
        case blockStylesheets = "block_stylesheets"
        case blockImages = "block_images"
        case blockMedia = "block_media"
        case blockFont = "block_font"
        case blockTextTrack = "block_text_track"
        case blockXhr = "block_xhr"
        case blockFetch = "block_fetch"
        case blockEventSource = "block_event_source"
        case blockWebSocket = "block_web_socket"
        case blockManifest = "block_manifest"
        case blockSpecificRequests = "block_specific_requests"
        case adjustTop = "adjust_top"
        case imageQuality = "image_quality"
        case extractHtml = "extract_html"
        case extractText = "extract_text"
        case darkMode = "dark_mode"
        case blockTracking = "block_tracking"
        case waitForEvent = "wait_for_event"
        case grayscale
        case resultFileName = "result_file_name"
        case enableIncognito = "enable_incognito"
        case timeout
        case scrollingScreenshot = "scrolling_screenshot"
        case multipleScrolling = "multiple_scrolling"
        case scrollSpeed = "scroll_speed"
        case duration
        case scrollBack = "scroll_back"
        case startImmediately = "start_immediately"
        case clip
        case sizes
    }
}