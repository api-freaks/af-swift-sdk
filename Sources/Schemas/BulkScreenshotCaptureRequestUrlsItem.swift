import Foundation

public struct BulkScreenshotCaptureRequestUrlsItem: Codable, Hashable, Sendable {
    public let url: String
    /// Sets the accepted languages for the HTTP request. This is sent as the Accept-Language header.
    public let acceptLanguages: String?
    /// Initial vertical scroll position in pixels before capture. Use to position mid-page content in viewport. Not supported for PDF.
    public let adjustTop: Int?
    /// Blocks requests to known ad networks for cleaner, distraction-free screenshots.
    public let blockAds: Bool?
    /// Blocks live chat popups, support bubbles, and messaging interfaces.
    public let blockChatWidgets: Bool?
    /// Blocks EventSource (SSE) connections - prevents real-time data streams.
    public let blockEventSource: Bool?
    /// Blocks all Fetch API requests - stops async data loading.
    public let blockFetch: Bool?
    /// Blocks external font files - page falls back to system defaults. Supported: woff, woff2, ttf, otf, eot.
    public let blockFont: Bool?
    /// Blocks all image resources (jpg, png, gif, webp, svg, etc.) for faster rendering.
    public let blockImages: Bool?
    /// Disables all JavaScript execution. Renders a static version of the page. Speeds up capture but may break dynamic content.
    public let blockJs: Bool?
    /// Blocks manifest files (.json, .webmanifest) - disables PWA-related functionality.
    public let blockManifest: Bool?
    /// Blocks audio and video resources (mp3, mp4, webm, etc.) from loading.
    public let blockMedia: Bool?
    /// Fine-grained blocking of specific URLs or patterns. Separate multiple rules by comma, space, or newline. Default: empty.
    public let blockSpecificRequests: String?
    /// Blocks all stylesheets - page renders as raw HTML without visual formatting.
    public let blockStylesheets: Bool?
    /// Blocks subtitles and caption overlays from loading.
    public let blockTextTrack: Bool?
    /// Blocks tracking scripts and analytics services for cleaner, privacy-oriented renders.
    public let blockTracking: Bool?
    /// Blocks WebSocket connections - prevents real-time bidirectional communication.
    public let blockWebSocket: Bool?
    /// Blocks all XMLHttpRequest (AJAX) calls - prevents dynamic API-driven content.
    public let blockXhr: Bool?
    /// CSS selectors to blur before capture. Masks sensitive data like emails, payments, or personal info. Multiple selectors supported. Default: empty.
    public let blurSelector: String?
    /// CSS selector of the message shown for a wrong answer. While it is visible, the solver tries again.
    public let captchaError: String?
    /// CSS selector of the captcha picture. Required when solve_captcha is true.
    public let captchaImage: String?
    /// CSS selector of the box the answer is typed into. Required when solve_captcha is true.
    public let captchaInput: String?
    /// CSS selector of the control that loads a new captcha picture before the next try.
    public let captchaRefresh: String?
    /// Number of guesses the solver makes, from 1 to 5.
    public let captchaRetries: Int?
    /// CSS selector of the button to click after the answer is typed.
    public let captchaSubmit: String?
    /// Loads the page through a datacenter proxy. Adds 20 credits per request. Ignored when premium_proxy is true or a custom proxy is set.
    public let classicProxy: Bool?
    /// Number of times to click the selector (when set via `selector_to_click`).
    public let clickRecursion: Int?
    /// Height of the clip area in pixels. Default: null.
    public let clipHeight: Int?
    /// Width of the clip area in pixels. Default: null.
    public let clipWidth: Int?
    /// X coordinate (in pixels) for the top-left corner of the clip area. Default: null.
    public let clipX: Int?
    /// Y coordinate (in pixels) for the top-left corner of the clip area. Default: null.
    public let clipY: Int?
    /// Cookies to include in the request before rendering. Supports single or multiple cookies. Example: `cookie=value; otherCookie=otherValue;`.
    public let cookies: String?
    /// Two-letter country code, such as US or DE, for the exit address of classic_proxy or premium_proxy. Ignored when you send your own proxy. Any two-letter code is sent, including one that is not listed. Classic proxy countries: BG, GE, DE, HN, MD, UA, GB, US. Premium proxy countries: AF, AL, DZ, AO, AG, AR, AM, AW, AU, AT, AZ, BS, BH, BD, BB, BY, BE, BZ, BJ, BT, BO, BQ, BA, BW, BR, BN, BG, BF, BI, CV, KH, CM, CA, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, HR, CU, CW, CY, CZ, CD, DK, DJ, DM, DO, EC, EG, SV, GQ, EE, SZ, ET, FO, FJ, FI, FR, GF, PF, GA, GM, GE, DE, GH, GI, GR, GL, GD, GP, GU, GT, GG, GN, GW, GY, HT, HN, HK, HU, IS, IN, ID, IR, IQ, IE, IL, IT, JM, JP, JE, JO, KZ, KE, XK, KW, KG, LA, LV, LB, LS, LR, LY, LT, MO, MG, MW, MY, MV, ML, MT, MQ, MR, MU, YT, MX, MD, MN, ME, MA, MZ, MM, NA, NP, NL, NC, NZ, NI, NE, NG, MK, NO, OM, PK, PS, PA, PG, PY, PE, PH, PL, PT, PR, QA, RE, RO, RU, RW, KN, LC, VC, WS, SA, SN, RS, SC, SL, SG, SK, SI, SB, SO, ZA, KR, SS, ES, LK, SD, SR, SE, CH, SY, TW, TJ, TZ, TH, TL, TG, TO, TT, TN, TR, TM, UG, UA, AE, GB, US, UY, UZ, VE, VN, YE, ZM, ZW.
    public let country: String?
    /// Allows injecting custom CSS code into the page before rendering. Pass the CSS code directly as a string.
    public let css: String?
    /// Allows loading external CSS into the page. Provide a URL pointing to the CSS file.
    public let cssUrl: String?
    /// Custom HTML to render instead of loading a URL. Overrides the url option. Use for capturing specific HTML structures or dynamic content.
    public let customHtml: String?
    /// When set to `true`, websites that support prefers-color-scheme: dark will render in dark mode.
    public let darkMode: Bool?
    /// Wait period in milliseconds before capture. Allows animations, API responses, and dynamic elements to finish rendering.
    public let delay: Int?
    /// If `true`, screenshot/PDF is not stored on server and must be downloaded immediately.
    public let destroyScreenshot: Bool?
    /// Duration of scrolling action in seconds (0-60). Higher = longer video. Default: null (full page scroll).
    public let duration: Int?
    /// Stores the render in cache for reuse on subsequent identical requests.
    public let enableCaching: Bool?
    /// Enables private/incognito browsing. Each render starts with a clean slate - no cookies, cache, or session data persisted.
    public let enableIncognito: Bool?
    /// Returns rendered HTML as a .html file (includes JS-executed DOM). Only available with output=json.
    public let extractHtml: Bool?
    /// Extracts rendered page content as a structured .md (Markdown) file. Preserves headings, lists, links. Only with output=json.
    public let extractMarkdown: Bool?
    /// Strips all HTML and returns visible text as a .txt file. Ideal for text analysis, indexing, or AI pipelines. Only with output=json.
    public let extractText: Bool?
    /// If `true`, returns an error when the target page responds with 4xx or 5xx status.
    public let failOnError: Bool?
    /// Output format. PNG (lossless, transparency), JPEG (compressed, smaller size), WebP (modern, efficient), PDF (document). For scrolling captures: MP4, GIF, WebM. Scrolling capture formats: WEBM (web-optimized), MP4 (widely compatible, default), GIF (short loops).
    public let fileType: BulkScreenshotCaptureRequestUrlsItemFileType?
    /// Response format: json (default).
    public let format: BulkScreenshotCaptureRequestUrlsItemFormat?
    /// If `true`, bypasses cache and captures a fresh render. If `false`, returns cached version when available.
    public let fresh: Bool?
    /// Captures the entire webpage from top to bottom, including scrollable content outside the viewport. Ideal for long-form pages.
    public let fullPage: Bool?
    /// Extracts all image URLs from the rendered DOM and returns them in structured format. Only with output=json.
    public let getImageUrls: Bool?
    /// Renders the page with a GPU, including WebGL and canvas content. Adds 20 credits per request.
    public let gpu: Bool?
    /// Applies a grayscale filter to the screenshot. Requires a value from 0 (no effect) to 100 (fully grayscale).
    public let grayscale: Int?
    /// Custom HTTP headers to include as key=value pairs. Use a semicolon to separate multiple headers (e.g., `key1=value1;key2=value2`).
    public let headers: String?
    /// Viewport height in pixels. Controls how much vertical area is visible. Max: 4320.
    public let height: Int?
    /// Compression level for JPEG output (0-100). Lower = smaller file, higher = better quality. Only applies to JPEG.
    public let imageQuality: Int?
    /// Allows injecting custom JavaScript code into the page before rendering. Pass the JavaScript code directly as a string.
    public let js: String?
    /// Allows loading external JavaScript into the page. Provide a URL pointing to the script file.
    public let jsUrl: String?
    /// Specify latitude for the browser Geolocation API. Provide a numeric value. Default: null (not set).
    public let latitude: Float?
    /// Automatically scrolls the page to trigger lazy-loaded images and components. Ensures complete content capture.
    public let lazyLoad: Bool?
    /// Specify longitude for the browser Geolocation API. Provide a numeric value. Default: null (not set).
    public let longitude: Float?
    /// Markdown to render instead of loading a URL. Works like custom_html, so you can capture a README or notes without hosting a page.
    public let markdown: String?
    /// Hides or blocks cookie consent banners and popups before capture.
    public let noCookieBanners: Bool?
    /// Recognition model used by the captcha solver: mini-ocr-v1 (default) or ocr-v1.
    public let ocrModel: BulkScreenshotCaptureRequestUrlsItemOcrModel?
    /// Replaces simple white/plain backgrounds with transparency for a cut-out effect. Only works with PNG output.
    public let omitBackground: Bool?
    /// Set the output format. `json` returns metadata with a hosted file URL. `image` streams the raw file bytes directly.
    public let output: BulkScreenshotCaptureRequestUrlsItemOutput?
    /// PDF output options. Applies when file_type is PDF.
    public let pdfOptions: BulkScreenshotCaptureRequestUrlsItemPdfOptions?
    /// Loads the page through a residential proxy. Adds 200 credits per request. Used instead of classic_proxy.
    public let premiumProxy: Bool?
    /// Allows defining a proxy for the connection. Provide a JSON string with keys: server (include port number), username, and password.
    public let proxy: String?
    /// CSS selectors to remove before capture. Deletes matched elements from DOM. Ideal for cleaning ads, popups, sidebars. Multiple selectors supported. Default: empty.
    public let removeSelector: String?
    /// Custom name for the output file. Helps with organized storage and retrieval. Note: non-unique names may overwrite existing files.
    public let resultFileName: String?
    /// Captures at 2x resolution for sharper, high-DPI output. Increases file size.
    public let retina: Bool?
    /// If `true`, scrolls to bottom then back to top, creating a seamless loop.
    public let scrollBack: Bool?
    /// Delay in milliseconds between scroll steps when `lazy_load` is enabled. Use higher values for heavy pages.
    public let scrollDelay: Int?
    /// Scrolling speed: fast, normal (default), or slow. Affects render time and output pacing.
    public let scrollSpeed: BulkScreenshotCaptureRequestUrlsItemScrollSpeed?
    /// Scrolls the page to bring the specified CSS selector into view before capture. Ideal for below-the-fold content. Default: empty.
    public let scrollToElement: String?
    /// Enables scrolling screenshot mode to capture a video (webm, gif, mp4) of the webpage.
    public let scrollingScreenshot: Bool?
    /// CSS selector to capture a specific element. Only that element is rendered. Falls back to full page if not found. Default: empty.
    public let selector: String?
    /// CSS selector for an element to click before capturing the screenshot. Useful for opening dropdowns, modals, or triggering content.
    public let selectorToClick: String?
    /// Solves a captcha made of text drawn in a picture, then takes the screenshot. Requires captcha_image and captcha_input. Adds 20 credits per request.
    public let solveCaptcha: Bool?
    /// Starts recording immediately without waiting for full page load.
    public let startImmediately: Bool?
    /// Makes the browser look like a regular visitor for pages that block automated traffic. No extra credits.
    public let stealth: Bool?
    /// Specifies the width of the thumbnail in pixels. Default value is 0 (meaning no specific value is set, and the screenshot is returned at its original resolution).
    public let thumbnailWidth: Int?
    /// Maximum wait in milliseconds for page load before aborting. Adjust for slow/heavy pages. Default: 100000 (100s).
    public let timeout: Int?
    /// IANA timezone the browser uses while rendering, such as Asia/Karachi or Europe/London. Useful for clocks and localized dates.
    public let timezone: String?
    /// Time in seconds the render stays cached before auto-invalidation. Use higher values for static pages, lower for dynamic content. Default: 2592000 (30 days).
    public let ttl: Int?
    /// Custom User-Agent string sent in the request headers.
    public let userAgent: String?
    /// Records visible viewport only for a specified duration. Use with `duration` parameter. Ideal for dashboards and animations.
    public let video: Bool?
    /// Controls when rendering starts based on page load lifecycle. `load` (all resources), `domcontentloaded` (HTML parsed), `networkidle` (no network activity for 500ms).
    public let waitForEvent: BulkScreenshotCaptureRequestUrlsItemWaitForEvent?
    /// Viewport width in pixels. Simulates device screen sizes. Max: 7680.
    public let width: Int?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        url: String,
        acceptLanguages: String? = nil,
        adjustTop: Int? = nil,
        blockAds: Bool? = nil,
        blockChatWidgets: Bool? = nil,
        blockEventSource: Bool? = nil,
        blockFetch: Bool? = nil,
        blockFont: Bool? = nil,
        blockImages: Bool? = nil,
        blockJs: Bool? = nil,
        blockManifest: Bool? = nil,
        blockMedia: Bool? = nil,
        blockSpecificRequests: String? = nil,
        blockStylesheets: Bool? = nil,
        blockTextTrack: Bool? = nil,
        blockTracking: Bool? = nil,
        blockWebSocket: Bool? = nil,
        blockXhr: Bool? = nil,
        blurSelector: String? = nil,
        captchaError: String? = nil,
        captchaImage: String? = nil,
        captchaInput: String? = nil,
        captchaRefresh: String? = nil,
        captchaRetries: Int? = nil,
        captchaSubmit: String? = nil,
        classicProxy: Bool? = nil,
        clickRecursion: Int? = nil,
        clipHeight: Int? = nil,
        clipWidth: Int? = nil,
        clipX: Int? = nil,
        clipY: Int? = nil,
        cookies: String? = nil,
        country: String? = nil,
        css: String? = nil,
        cssUrl: String? = nil,
        customHtml: String? = nil,
        darkMode: Bool? = nil,
        delay: Int? = nil,
        destroyScreenshot: Bool? = nil,
        duration: Int? = nil,
        enableCaching: Bool? = nil,
        enableIncognito: Bool? = nil,
        extractHtml: Bool? = nil,
        extractMarkdown: Bool? = nil,
        extractText: Bool? = nil,
        failOnError: Bool? = nil,
        fileType: BulkScreenshotCaptureRequestUrlsItemFileType? = nil,
        format: BulkScreenshotCaptureRequestUrlsItemFormat? = nil,
        fresh: Bool? = nil,
        fullPage: Bool? = nil,
        getImageUrls: Bool? = nil,
        gpu: Bool? = nil,
        grayscale: Int? = nil,
        headers: String? = nil,
        height: Int? = nil,
        imageQuality: Int? = nil,
        js: String? = nil,
        jsUrl: String? = nil,
        latitude: Float? = nil,
        lazyLoad: Bool? = nil,
        longitude: Float? = nil,
        markdown: String? = nil,
        noCookieBanners: Bool? = nil,
        ocrModel: BulkScreenshotCaptureRequestUrlsItemOcrModel? = nil,
        omitBackground: Bool? = nil,
        output: BulkScreenshotCaptureRequestUrlsItemOutput? = nil,
        pdfOptions: BulkScreenshotCaptureRequestUrlsItemPdfOptions? = nil,
        premiumProxy: Bool? = nil,
        proxy: String? = nil,
        removeSelector: String? = nil,
        resultFileName: String? = nil,
        retina: Bool? = nil,
        scrollBack: Bool? = nil,
        scrollDelay: Int? = nil,
        scrollSpeed: BulkScreenshotCaptureRequestUrlsItemScrollSpeed? = nil,
        scrollToElement: String? = nil,
        scrollingScreenshot: Bool? = nil,
        selector: String? = nil,
        selectorToClick: String? = nil,
        solveCaptcha: Bool? = nil,
        startImmediately: Bool? = nil,
        stealth: Bool? = nil,
        thumbnailWidth: Int? = nil,
        timeout: Int? = nil,
        timezone: String? = nil,
        ttl: Int? = nil,
        userAgent: String? = nil,
        video: Bool? = nil,
        waitForEvent: BulkScreenshotCaptureRequestUrlsItemWaitForEvent? = nil,
        width: Int? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.url = url
        self.acceptLanguages = acceptLanguages
        self.adjustTop = adjustTop
        self.blockAds = blockAds
        self.blockChatWidgets = blockChatWidgets
        self.blockEventSource = blockEventSource
        self.blockFetch = blockFetch
        self.blockFont = blockFont
        self.blockImages = blockImages
        self.blockJs = blockJs
        self.blockManifest = blockManifest
        self.blockMedia = blockMedia
        self.blockSpecificRequests = blockSpecificRequests
        self.blockStylesheets = blockStylesheets
        self.blockTextTrack = blockTextTrack
        self.blockTracking = blockTracking
        self.blockWebSocket = blockWebSocket
        self.blockXhr = blockXhr
        self.blurSelector = blurSelector
        self.captchaError = captchaError
        self.captchaImage = captchaImage
        self.captchaInput = captchaInput
        self.captchaRefresh = captchaRefresh
        self.captchaRetries = captchaRetries
        self.captchaSubmit = captchaSubmit
        self.classicProxy = classicProxy
        self.clickRecursion = clickRecursion
        self.clipHeight = clipHeight
        self.clipWidth = clipWidth
        self.clipX = clipX
        self.clipY = clipY
        self.cookies = cookies
        self.country = country
        self.css = css
        self.cssUrl = cssUrl
        self.customHtml = customHtml
        self.darkMode = darkMode
        self.delay = delay
        self.destroyScreenshot = destroyScreenshot
        self.duration = duration
        self.enableCaching = enableCaching
        self.enableIncognito = enableIncognito
        self.extractHtml = extractHtml
        self.extractMarkdown = extractMarkdown
        self.extractText = extractText
        self.failOnError = failOnError
        self.fileType = fileType
        self.format = format
        self.fresh = fresh
        self.fullPage = fullPage
        self.getImageUrls = getImageUrls
        self.gpu = gpu
        self.grayscale = grayscale
        self.headers = headers
        self.height = height
        self.imageQuality = imageQuality
        self.js = js
        self.jsUrl = jsUrl
        self.latitude = latitude
        self.lazyLoad = lazyLoad
        self.longitude = longitude
        self.markdown = markdown
        self.noCookieBanners = noCookieBanners
        self.ocrModel = ocrModel
        self.omitBackground = omitBackground
        self.output = output
        self.pdfOptions = pdfOptions
        self.premiumProxy = premiumProxy
        self.proxy = proxy
        self.removeSelector = removeSelector
        self.resultFileName = resultFileName
        self.retina = retina
        self.scrollBack = scrollBack
        self.scrollDelay = scrollDelay
        self.scrollSpeed = scrollSpeed
        self.scrollToElement = scrollToElement
        self.scrollingScreenshot = scrollingScreenshot
        self.selector = selector
        self.selectorToClick = selectorToClick
        self.solveCaptcha = solveCaptcha
        self.startImmediately = startImmediately
        self.stealth = stealth
        self.thumbnailWidth = thumbnailWidth
        self.timeout = timeout
        self.timezone = timezone
        self.ttl = ttl
        self.userAgent = userAgent
        self.video = video
        self.waitForEvent = waitForEvent
        self.width = width
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.url = try container.decode(String.self, forKey: .url)
        self.acceptLanguages = try container.decodeIfPresent(String.self, forKey: .acceptLanguages)
        self.adjustTop = try container.decodeIfPresent(Int.self, forKey: .adjustTop)
        self.blockAds = try container.decodeIfPresent(Bool.self, forKey: .blockAds)
        self.blockChatWidgets = try container.decodeIfPresent(Bool.self, forKey: .blockChatWidgets)
        self.blockEventSource = try container.decodeIfPresent(Bool.self, forKey: .blockEventSource)
        self.blockFetch = try container.decodeIfPresent(Bool.self, forKey: .blockFetch)
        self.blockFont = try container.decodeIfPresent(Bool.self, forKey: .blockFont)
        self.blockImages = try container.decodeIfPresent(Bool.self, forKey: .blockImages)
        self.blockJs = try container.decodeIfPresent(Bool.self, forKey: .blockJs)
        self.blockManifest = try container.decodeIfPresent(Bool.self, forKey: .blockManifest)
        self.blockMedia = try container.decodeIfPresent(Bool.self, forKey: .blockMedia)
        self.blockSpecificRequests = try container.decodeIfPresent(String.self, forKey: .blockSpecificRequests)
        self.blockStylesheets = try container.decodeIfPresent(Bool.self, forKey: .blockStylesheets)
        self.blockTextTrack = try container.decodeIfPresent(Bool.self, forKey: .blockTextTrack)
        self.blockTracking = try container.decodeIfPresent(Bool.self, forKey: .blockTracking)
        self.blockWebSocket = try container.decodeIfPresent(Bool.self, forKey: .blockWebSocket)
        self.blockXhr = try container.decodeIfPresent(Bool.self, forKey: .blockXhr)
        self.blurSelector = try container.decodeIfPresent(String.self, forKey: .blurSelector)
        self.captchaError = try container.decodeIfPresent(String.self, forKey: .captchaError)
        self.captchaImage = try container.decodeIfPresent(String.self, forKey: .captchaImage)
        self.captchaInput = try container.decodeIfPresent(String.self, forKey: .captchaInput)
        self.captchaRefresh = try container.decodeIfPresent(String.self, forKey: .captchaRefresh)
        self.captchaRetries = try container.decodeIfPresent(Int.self, forKey: .captchaRetries)
        self.captchaSubmit = try container.decodeIfPresent(String.self, forKey: .captchaSubmit)
        self.classicProxy = try container.decodeIfPresent(Bool.self, forKey: .classicProxy)
        self.clickRecursion = try container.decodeIfPresent(Int.self, forKey: .clickRecursion)
        self.clipHeight = try container.decodeIfPresent(Int.self, forKey: .clipHeight)
        self.clipWidth = try container.decodeIfPresent(Int.self, forKey: .clipWidth)
        self.clipX = try container.decodeIfPresent(Int.self, forKey: .clipX)
        self.clipY = try container.decodeIfPresent(Int.self, forKey: .clipY)
        self.cookies = try container.decodeIfPresent(String.self, forKey: .cookies)
        self.country = try container.decodeIfPresent(String.self, forKey: .country)
        self.css = try container.decodeIfPresent(String.self, forKey: .css)
        self.cssUrl = try container.decodeIfPresent(String.self, forKey: .cssUrl)
        self.customHtml = try container.decodeIfPresent(String.self, forKey: .customHtml)
        self.darkMode = try container.decodeIfPresent(Bool.self, forKey: .darkMode)
        self.delay = try container.decodeIfPresent(Int.self, forKey: .delay)
        self.destroyScreenshot = try container.decodeIfPresent(Bool.self, forKey: .destroyScreenshot)
        self.duration = try container.decodeIfPresent(Int.self, forKey: .duration)
        self.enableCaching = try container.decodeIfPresent(Bool.self, forKey: .enableCaching)
        self.enableIncognito = try container.decodeIfPresent(Bool.self, forKey: .enableIncognito)
        self.extractHtml = try container.decodeIfPresent(Bool.self, forKey: .extractHtml)
        self.extractMarkdown = try container.decodeIfPresent(Bool.self, forKey: .extractMarkdown)
        self.extractText = try container.decodeIfPresent(Bool.self, forKey: .extractText)
        self.failOnError = try container.decodeIfPresent(Bool.self, forKey: .failOnError)
        self.fileType = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemFileType.self, forKey: .fileType)
        self.format = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemFormat.self, forKey: .format)
        self.fresh = try container.decodeIfPresent(Bool.self, forKey: .fresh)
        self.fullPage = try container.decodeIfPresent(Bool.self, forKey: .fullPage)
        self.getImageUrls = try container.decodeIfPresent(Bool.self, forKey: .getImageUrls)
        self.gpu = try container.decodeIfPresent(Bool.self, forKey: .gpu)
        self.grayscale = try container.decodeIfPresent(Int.self, forKey: .grayscale)
        self.headers = try container.decodeIfPresent(String.self, forKey: .headers)
        self.height = try container.decodeIfPresent(Int.self, forKey: .height)
        self.imageQuality = try container.decodeIfPresent(Int.self, forKey: .imageQuality)
        self.js = try container.decodeIfPresent(String.self, forKey: .js)
        self.jsUrl = try container.decodeIfPresent(String.self, forKey: .jsUrl)
        self.latitude = try container.decodeIfPresent(Float.self, forKey: .latitude)
        self.lazyLoad = try container.decodeIfPresent(Bool.self, forKey: .lazyLoad)
        self.longitude = try container.decodeIfPresent(Float.self, forKey: .longitude)
        self.markdown = try container.decodeIfPresent(String.self, forKey: .markdown)
        self.noCookieBanners = try container.decodeIfPresent(Bool.self, forKey: .noCookieBanners)
        self.ocrModel = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemOcrModel.self, forKey: .ocrModel)
        self.omitBackground = try container.decodeIfPresent(Bool.self, forKey: .omitBackground)
        self.output = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemOutput.self, forKey: .output)
        self.pdfOptions = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemPdfOptions.self, forKey: .pdfOptions)
        self.premiumProxy = try container.decodeIfPresent(Bool.self, forKey: .premiumProxy)
        self.proxy = try container.decodeIfPresent(String.self, forKey: .proxy)
        self.removeSelector = try container.decodeIfPresent(String.self, forKey: .removeSelector)
        self.resultFileName = try container.decodeIfPresent(String.self, forKey: .resultFileName)
        self.retina = try container.decodeIfPresent(Bool.self, forKey: .retina)
        self.scrollBack = try container.decodeIfPresent(Bool.self, forKey: .scrollBack)
        self.scrollDelay = try container.decodeIfPresent(Int.self, forKey: .scrollDelay)
        self.scrollSpeed = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemScrollSpeed.self, forKey: .scrollSpeed)
        self.scrollToElement = try container.decodeIfPresent(String.self, forKey: .scrollToElement)
        self.scrollingScreenshot = try container.decodeIfPresent(Bool.self, forKey: .scrollingScreenshot)
        self.selector = try container.decodeIfPresent(String.self, forKey: .selector)
        self.selectorToClick = try container.decodeIfPresent(String.self, forKey: .selectorToClick)
        self.solveCaptcha = try container.decodeIfPresent(Bool.self, forKey: .solveCaptcha)
        self.startImmediately = try container.decodeIfPresent(Bool.self, forKey: .startImmediately)
        self.stealth = try container.decodeIfPresent(Bool.self, forKey: .stealth)
        self.thumbnailWidth = try container.decodeIfPresent(Int.self, forKey: .thumbnailWidth)
        self.timeout = try container.decodeIfPresent(Int.self, forKey: .timeout)
        self.timezone = try container.decodeIfPresent(String.self, forKey: .timezone)
        self.ttl = try container.decodeIfPresent(Int.self, forKey: .ttl)
        self.userAgent = try container.decodeIfPresent(String.self, forKey: .userAgent)
        self.video = try container.decodeIfPresent(Bool.self, forKey: .video)
        self.waitForEvent = try container.decodeIfPresent(BulkScreenshotCaptureRequestUrlsItemWaitForEvent.self, forKey: .waitForEvent)
        self.width = try container.decodeIfPresent(Int.self, forKey: .width)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.url, forKey: .url)
        try container.encodeIfPresent(self.acceptLanguages, forKey: .acceptLanguages)
        try container.encodeIfPresent(self.adjustTop, forKey: .adjustTop)
        try container.encodeIfPresent(self.blockAds, forKey: .blockAds)
        try container.encodeIfPresent(self.blockChatWidgets, forKey: .blockChatWidgets)
        try container.encodeIfPresent(self.blockEventSource, forKey: .blockEventSource)
        try container.encodeIfPresent(self.blockFetch, forKey: .blockFetch)
        try container.encodeIfPresent(self.blockFont, forKey: .blockFont)
        try container.encodeIfPresent(self.blockImages, forKey: .blockImages)
        try container.encodeIfPresent(self.blockJs, forKey: .blockJs)
        try container.encodeIfPresent(self.blockManifest, forKey: .blockManifest)
        try container.encodeIfPresent(self.blockMedia, forKey: .blockMedia)
        try container.encodeIfPresent(self.blockSpecificRequests, forKey: .blockSpecificRequests)
        try container.encodeIfPresent(self.blockStylesheets, forKey: .blockStylesheets)
        try container.encodeIfPresent(self.blockTextTrack, forKey: .blockTextTrack)
        try container.encodeIfPresent(self.blockTracking, forKey: .blockTracking)
        try container.encodeIfPresent(self.blockWebSocket, forKey: .blockWebSocket)
        try container.encodeIfPresent(self.blockXhr, forKey: .blockXhr)
        try container.encodeIfPresent(self.blurSelector, forKey: .blurSelector)
        try container.encodeIfPresent(self.captchaError, forKey: .captchaError)
        try container.encodeIfPresent(self.captchaImage, forKey: .captchaImage)
        try container.encodeIfPresent(self.captchaInput, forKey: .captchaInput)
        try container.encodeIfPresent(self.captchaRefresh, forKey: .captchaRefresh)
        try container.encodeIfPresent(self.captchaRetries, forKey: .captchaRetries)
        try container.encodeIfPresent(self.captchaSubmit, forKey: .captchaSubmit)
        try container.encodeIfPresent(self.classicProxy, forKey: .classicProxy)
        try container.encodeIfPresent(self.clickRecursion, forKey: .clickRecursion)
        try container.encodeIfPresent(self.clipHeight, forKey: .clipHeight)
        try container.encodeIfPresent(self.clipWidth, forKey: .clipWidth)
        try container.encodeIfPresent(self.clipX, forKey: .clipX)
        try container.encodeIfPresent(self.clipY, forKey: .clipY)
        try container.encodeIfPresent(self.cookies, forKey: .cookies)
        try container.encodeIfPresent(self.country, forKey: .country)
        try container.encodeIfPresent(self.css, forKey: .css)
        try container.encodeIfPresent(self.cssUrl, forKey: .cssUrl)
        try container.encodeIfPresent(self.customHtml, forKey: .customHtml)
        try container.encodeIfPresent(self.darkMode, forKey: .darkMode)
        try container.encodeIfPresent(self.delay, forKey: .delay)
        try container.encodeIfPresent(self.destroyScreenshot, forKey: .destroyScreenshot)
        try container.encodeIfPresent(self.duration, forKey: .duration)
        try container.encodeIfPresent(self.enableCaching, forKey: .enableCaching)
        try container.encodeIfPresent(self.enableIncognito, forKey: .enableIncognito)
        try container.encodeIfPresent(self.extractHtml, forKey: .extractHtml)
        try container.encodeIfPresent(self.extractMarkdown, forKey: .extractMarkdown)
        try container.encodeIfPresent(self.extractText, forKey: .extractText)
        try container.encodeIfPresent(self.failOnError, forKey: .failOnError)
        try container.encodeIfPresent(self.fileType, forKey: .fileType)
        try container.encodeIfPresent(self.format, forKey: .format)
        try container.encodeIfPresent(self.fresh, forKey: .fresh)
        try container.encodeIfPresent(self.fullPage, forKey: .fullPage)
        try container.encodeIfPresent(self.getImageUrls, forKey: .getImageUrls)
        try container.encodeIfPresent(self.gpu, forKey: .gpu)
        try container.encodeIfPresent(self.grayscale, forKey: .grayscale)
        try container.encodeIfPresent(self.headers, forKey: .headers)
        try container.encodeIfPresent(self.height, forKey: .height)
        try container.encodeIfPresent(self.imageQuality, forKey: .imageQuality)
        try container.encodeIfPresent(self.js, forKey: .js)
        try container.encodeIfPresent(self.jsUrl, forKey: .jsUrl)
        try container.encodeIfPresent(self.latitude, forKey: .latitude)
        try container.encodeIfPresent(self.lazyLoad, forKey: .lazyLoad)
        try container.encodeIfPresent(self.longitude, forKey: .longitude)
        try container.encodeIfPresent(self.markdown, forKey: .markdown)
        try container.encodeIfPresent(self.noCookieBanners, forKey: .noCookieBanners)
        try container.encodeIfPresent(self.ocrModel, forKey: .ocrModel)
        try container.encodeIfPresent(self.omitBackground, forKey: .omitBackground)
        try container.encodeIfPresent(self.output, forKey: .output)
        try container.encodeIfPresent(self.pdfOptions, forKey: .pdfOptions)
        try container.encodeIfPresent(self.premiumProxy, forKey: .premiumProxy)
        try container.encodeIfPresent(self.proxy, forKey: .proxy)
        try container.encodeIfPresent(self.removeSelector, forKey: .removeSelector)
        try container.encodeIfPresent(self.resultFileName, forKey: .resultFileName)
        try container.encodeIfPresent(self.retina, forKey: .retina)
        try container.encodeIfPresent(self.scrollBack, forKey: .scrollBack)
        try container.encodeIfPresent(self.scrollDelay, forKey: .scrollDelay)
        try container.encodeIfPresent(self.scrollSpeed, forKey: .scrollSpeed)
        try container.encodeIfPresent(self.scrollToElement, forKey: .scrollToElement)
        try container.encodeIfPresent(self.scrollingScreenshot, forKey: .scrollingScreenshot)
        try container.encodeIfPresent(self.selector, forKey: .selector)
        try container.encodeIfPresent(self.selectorToClick, forKey: .selectorToClick)
        try container.encodeIfPresent(self.solveCaptcha, forKey: .solveCaptcha)
        try container.encodeIfPresent(self.startImmediately, forKey: .startImmediately)
        try container.encodeIfPresent(self.stealth, forKey: .stealth)
        try container.encodeIfPresent(self.thumbnailWidth, forKey: .thumbnailWidth)
        try container.encodeIfPresent(self.timeout, forKey: .timeout)
        try container.encodeIfPresent(self.timezone, forKey: .timezone)
        try container.encodeIfPresent(self.ttl, forKey: .ttl)
        try container.encodeIfPresent(self.userAgent, forKey: .userAgent)
        try container.encodeIfPresent(self.video, forKey: .video)
        try container.encodeIfPresent(self.waitForEvent, forKey: .waitForEvent)
        try container.encodeIfPresent(self.width, forKey: .width)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case url
        case acceptLanguages = "accept_languages"
        case adjustTop = "adjust_top"
        case blockAds = "block_ads"
        case blockChatWidgets = "block_chat_widgets"
        case blockEventSource = "block_event_source"
        case blockFetch = "block_fetch"
        case blockFont = "block_font"
        case blockImages = "block_images"
        case blockJs = "block_js"
        case blockManifest = "block_manifest"
        case blockMedia = "block_media"
        case blockSpecificRequests = "block_specific_requests"
        case blockStylesheets = "block_stylesheets"
        case blockTextTrack = "block_text_track"
        case blockTracking = "block_tracking"
        case blockWebSocket = "block_web_socket"
        case blockXhr = "block_xhr"
        case blurSelector = "blur_selector"
        case captchaError = "captcha_error"
        case captchaImage = "captcha_image"
        case captchaInput = "captcha_input"
        case captchaRefresh = "captcha_refresh"
        case captchaRetries = "captcha_retries"
        case captchaSubmit = "captcha_submit"
        case classicProxy = "classic_proxy"
        case clickRecursion = "click_recursion"
        case clipHeight = "clip[height]"
        case clipWidth = "clip[width]"
        case clipX = "clip[x]"
        case clipY = "clip[y]"
        case cookies
        case country
        case css
        case cssUrl = "css_url"
        case customHtml = "custom_html"
        case darkMode = "dark_mode"
        case delay
        case destroyScreenshot = "destroy_screenshot"
        case duration
        case enableCaching = "enable_caching"
        case enableIncognito = "enable_incognito"
        case extractHtml = "extract_html"
        case extractMarkdown = "extract_markdown"
        case extractText = "extract_text"
        case failOnError = "fail_on_error"
        case fileType = "file_type"
        case format
        case fresh
        case fullPage = "full_page"
        case getImageUrls = "get_image_urls"
        case gpu
        case grayscale
        case headers
        case height
        case imageQuality = "image_quality"
        case js
        case jsUrl = "js_url"
        case latitude
        case lazyLoad = "lazy_load"
        case longitude
        case markdown
        case noCookieBanners = "no_cookie_banners"
        case ocrModel = "ocr_model"
        case omitBackground = "omit_background"
        case output
        case pdfOptions = "pdf_options"
        case premiumProxy = "premium_proxy"
        case proxy
        case removeSelector = "remove_selector"
        case resultFileName = "result_file_name"
        case retina
        case scrollBack = "scroll_back"
        case scrollDelay = "scroll_delay"
        case scrollSpeed = "scroll_speed"
        case scrollToElement = "scroll_to_element"
        case scrollingScreenshot = "scrolling_screenshot"
        case selector
        case selectorToClick = "selector_to_click"
        case solveCaptcha = "solve_captcha"
        case startImmediately = "start_immediately"
        case stealth
        case thumbnailWidth = "thumbnail_width"
        case timeout
        case timezone
        case ttl
        case userAgent = "user_agent"
        case video
        case waitForEvent = "wait_for_event"
        case width
    }
}