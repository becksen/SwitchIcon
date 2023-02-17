//
//  BMAppIconManager.swift
//  SwitchIcon
//
//  Created by Timmy Becker on 18.02.23.
//

import Foundation
import UIKit

class BMAppIconManager {
    enum BMAppIcon: CaseIterable {
        case classic,
             AppIcon,
             blackIcon
        
        
        var name: String? {
            switch self {
            case .classic:
                return nil
            case .AppIcon:
                return "AppIcon"
            case .blackIcon:
                return "blackIcon"
                
            }
        }
        
        var preview: UIImage {
            switch self {
            case .classic:
                return UIImage(imageLiteralResourceName: "AppIcon@2x.png")
            case .AppIcon:
                return UIImage(imageLiteralResourceName: "AppIcon@2x.png")
            case.blackIcon:
                return UIImage(imageLiteralResourceName: "blackIcon@2x.png")
            }
        }
        var current: BMAppIcon {
            return BMAppIcon.allCases.first(where: {
                $0.name == UIApplication.shared.alternateIconName
            }) ?? .classic
        }
        
        func setIcon(_ appIcon: BMAppIcon, completion: ((Bool) -> Void)? = nil) {
            
            guard current != appIcon,
                  UIApplication.shared.supportsAlternateIcons
            else { return }
            
            UIApplication.shared.setAlternateIconName(appIcon.name) { error in
                if let error = error {
                    print("Error setting alternate icon \(appIcon.name ?? ""): \(error.localizedDescription)")
                }
                completion?(error != nil)
            }
        }
    }
}
