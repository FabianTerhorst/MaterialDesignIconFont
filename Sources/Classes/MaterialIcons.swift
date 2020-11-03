//
//  MaterialIcons.swift
//  everHome
//
//  Created by Fabian Terhorst on 30.08.16.
//  Copyright © 2016 everHome. All rights reserved.
//

import UIKit

public extension String {
    public static func materialIcon(_ font: MaterialDesignIconFont) -> String {
        return IconFont.codes[font.rawValue]
    }
    public static func meteoconIcon(_ font: MeteoconcsIconFont) -> String {
        return MeteoconcsIconFontCodes[font.rawValue]
    }
}

public extension NSString {
    public static func materialIcon(_ font: MaterialDesignIconFont) -> NSString {
        return NSString(string: String.materialIcon(font))
    }
    public static func meteoconIcon(_ font: MeteoconcsIconFont) -> NSString {
        return NSString(string: String.meteoconIcon(font))
    }
}

public extension UIFont {
    public static func materialIconOfSize(_ size: CGFloat) -> UIFont? {
        //var onceToken: Int = 0
        //let filename = "materialdesignicons"
        let fontname = "Material Design Icons"
        
        //if UIFont.fontNames(forFamilyName: fontname).count == 0 {
            //dispatch_once(&onceToken, { () -> Void in
            //    FontLoader.loadFont(filename)
            //})
        //}
        return UIFont(name: fontname, size: size)
    }
    public static func meteoconcsIconOfSize(_ size: CGFloat) -> UIFont? {
        //var onceToken: Int = 0
        //let filename = "materialdesignicons"
        let fontname = "Meteocons"
        
        //if UIFont.fontNames(forFamilyName: fontname).count == 0 {
        //dispatch_once(&onceToken, { () -> Void in
        //    FontLoader.loadFont(filename)
        //})
        //}
        return UIFont(name: fontname, size: size)
    }
}

public class FontLoader {
    public class func loadFont(_ name: String = "materialdesignicons") -> CGFont? {
        let bundle = Bundle(for: FontLoader.self)
        let fileExtension = "ttf"
        
        let baseFolderPath = bundle.resourcePath! + "/MaterialDesignIconFont.bundle";
        let basePath = baseFolderPath as NSString
        let fontFilePath = basePath.appendingPathComponent(name + "." + fileExtension)
        let fontURL = URL(fileURLWithPath: fontFilePath)
        
        let data = try? Data(contentsOf: fontURL)
        if let data = data as CFData? {
            if let provider = CGDataProvider(data: data), let font = CGFont(provider) {
                var error: Unmanaged<CFError>?
                if !CTFontManagerRegisterGraphicsFont(font, &error) {
                    let errorDescription: CFString = CFErrorCopyDescription(error!.takeUnretainedValue())
                    print("font error", errorDescription)
                    //let nsError = error!.takeUnretainedValue() as AnyObject as! NSError
                    //    NSException(name: NSExceptionName.internalInconsistencyException, reason: errorDescription as String, userInfo: [NSUnderlyingErrorKey: nsError]).raise()
                }
                return font
            }
        }
        return nil
    }
}
