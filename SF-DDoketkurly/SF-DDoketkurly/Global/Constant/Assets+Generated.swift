// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

#if os(macOS)
  import AppKit
#elseif os(iOS)
  import UIKit
#elseif os(tvOS) || os(watchOS)
  import UIKit
#endif

// Deprecated typealiases
@available(*, deprecated, renamed: "ColorAsset.Color", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetColorTypeAlias = ColorAsset.Color
@available(*, deprecated, renamed: "ImageAsset.Image", message: "This typealias will be removed in SwiftGen 7.0")
internal typealias AssetImageTypeAlias = ImageAsset.Image

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Asset Catalogs

// swiftlint:disable identifier_name line_length nesting type_body_length type_name
internal enum Asset {
  internal enum Assets {
    internal static let accentColor = ColorAsset(name: "AccentColor")
    internal static let btnCart = ImageAsset(name: "btn_Cart")
    internal static let btnMap = ImageAsset(name: "btn_Map")
    internal static let icCategory = ImageAsset(name: "ic_category")
    internal static let icCategoryUnselect = ImageAsset(name: "ic_category_unselect")
    internal static let icHome = ImageAsset(name: "ic_home")
    internal static let icHomeUnselect = ImageAsset(name: "ic_home_unselect")
    internal static let icMy = ImageAsset(name: "ic_my")
    internal static let icMyUnselect = ImageAsset(name: "ic_my_unselect")
    internal static let icSearch = ImageAsset(name: "ic_search")
    internal static let icSearchUnselect = ImageAsset(name: "ic_search_unselect")
    internal static let iconLogo = ImageAsset(name: "iconLogo")
    internal static let imgBanner = ImageAsset(name: "imgBanner")
    internal static let imgBanner2 = ImageAsset(name: "imgBanner2")
    internal static let imgBanner3 = ImageAsset(name: "imgBanner3")
    internal static let imgBanner4 = ImageAsset(name: "imgBanner4")
    internal static let imgBanner5 = ImageAsset(name: "imgBanner5")
    internal static let imgBanner6 = ImageAsset(name: "imgBanner6")
    internal static let imgBanner7 = ImageAsset(name: "imgBanner7")
    internal static let imgProduct1 = ImageAsset(name: "imgProduct1")
    internal static let imgProduct2 = ImageAsset(name: "imgProduct2")
    internal static let imgProduct3 = ImageAsset(name: "imgProduct3")
    internal static let imgProduct4 = ImageAsset(name: "imgProduct4")
    internal static let imgProduct5 = ImageAsset(name: "imgProduct5")
    internal static let imgProduct6 = ImageAsset(name: "imgProduct6")
    internal static let imgProduct7 = ImageAsset(name: "imgProduct7")
    internal static let imgLongBanner = ImageAsset(name: "img_long_banner")
    internal static let imgLongBanner2 = ImageAsset(name: "img_long_banner2")
    internal static let imgLongBanner3 = ImageAsset(name: "img_long_banner3")
  }
  internal enum Colors {
    internal static let kurlyPurple = ColorAsset(name: "kurlyPurple")
    internal static let subtitleGray = ColorAsset(name: "subtitleGray")
    internal static let textGray = ColorAsset(name: "textGray")
    internal static let textOrange = ColorAsset(name: "textOrange")
  }
}
// swiftlint:enable identifier_name line_length nesting type_body_length type_name

// MARK: - Implementation Details

internal final class ColorAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Color = NSColor
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Color = UIColor
  #endif

  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  internal private(set) lazy var color: Color = {
    guard let color = Color(asset: self) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }()

  #if os(iOS) || os(tvOS)
  @available(iOS 11.0, tvOS 11.0, *)
  internal func color(compatibleWith traitCollection: UITraitCollection) -> Color {
    let bundle = BundleToken.bundle
    guard let color = Color(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load color asset named \(name).")
    }
    return color
  }
  #endif

  fileprivate init(name: String) {
    self.name = name
  }
}

internal extension ColorAsset.Color {
  @available(iOS 11.0, tvOS 11.0, watchOS 4.0, macOS 10.13, *)
  convenience init?(asset: ColorAsset) {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSColor.Name(asset.name), bundle: bundle)
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

internal struct ImageAsset {
  internal fileprivate(set) var name: String

  #if os(macOS)
  internal typealias Image = NSImage
  #elseif os(iOS) || os(tvOS) || os(watchOS)
  internal typealias Image = UIImage
  #endif

  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, macOS 10.7, *)
  internal var image: Image {
    let bundle = BundleToken.bundle
    #if os(iOS) || os(tvOS)
    let image = Image(named: name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    let name = NSImage.Name(self.name)
    let image = (bundle == .main) ? NSImage(named: name) : bundle.image(forResource: name)
    #elseif os(watchOS)
    let image = Image(named: name)
    #endif
    guard let result = image else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }

  #if os(iOS) || os(tvOS)
  @available(iOS 8.0, tvOS 9.0, *)
  internal func image(compatibleWith traitCollection: UITraitCollection) -> Image {
    let bundle = BundleToken.bundle
    guard let result = Image(named: name, in: bundle, compatibleWith: traitCollection) else {
      fatalError("Unable to load image asset named \(name).")
    }
    return result
  }
  #endif
}

internal extension ImageAsset.Image {
  @available(iOS 8.0, tvOS 9.0, watchOS 2.0, *)
  @available(macOS, deprecated,
    message: "This initializer is unsafe on macOS, please use the ImageAsset.image property")
  convenience init?(asset: ImageAsset) {
    #if os(iOS) || os(tvOS)
    let bundle = BundleToken.bundle
    self.init(named: asset.name, in: bundle, compatibleWith: nil)
    #elseif os(macOS)
    self.init(named: NSImage.Name(asset.name))
    #elseif os(watchOS)
    self.init(named: asset.name)
    #endif
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
