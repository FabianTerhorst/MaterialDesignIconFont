//
//  MaterialIcons.swift
//  everHome
//
//  Created by Fabian Terhorst on 30.08.16.
//  Copyright © 2016 everHome. All rights reserved.
//

import UIKit

public extension String {
    public static func materialIcon(font: MaterialDesignIconFont) -> String {
        return IconFont.codes[font.rawValue]
    }
}

public extension NSString {
    public static func materialIcon(font: MaterialDesignIconFont) -> NSString {
        return NSString(string: String.materialIcon(font))
    }
}

public extension UIFont {
    public static func materialIconOfSize(size: CGFloat) -> UIFont {
        var onceToken: dispatch_once_t = 0
        let filename = "materialdesignicons-webfont"
        let fontname = "Material Design Icons"
        
        if UIFont.fontNamesForFamilyName(fontname).count == 0 {
            dispatch_once(&onceToken, { () -> Void in
                FontLoader.loadFont(filename)
            })
        }
        return UIFont(name: fontname, size: size)!
    }
}

private class FontLoader {
    class func loadFont(name: String) {
        let bundle = NSBundle(forClass: FontLoader.self)
        let fileExtension = "ttf"
        
        let fontURL = bundle.URLForResource(name, withExtension: fileExtension)!
        
        let data = NSData(contentsOfURL: fontURL)
        let provider = CGDataProviderCreateWithCFData(data)
        let font = CGFontCreateWithDataProvider(provider)!
        
        var error: Unmanaged<CFError>?
        if !CTFontManagerRegisterGraphicsFont(font, &error) {
            let errorDescription: CFStringRef = CFErrorCopyDescription(error!.takeUnretainedValue())
            let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
            NSException(name: NSInternalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
        }
    }
}