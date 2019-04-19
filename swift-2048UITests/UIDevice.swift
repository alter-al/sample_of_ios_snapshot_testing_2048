//
//  UIDevice.swift
//  swift-2048UITests
//
//  Created by a.alterpesotskiy on 19/04/2019.
//  Copyright © 2019 Austin Zheng. All rights reserved.
//

import XCTest

extension UIDevice {
    
    enum UIDeviceModelType : Equatable {
        
        case iPhoneX
        case iPhoneXR
        case iPhoneX_Max
        case other(model: String)
        
        static func type(from model: String) -> UIDeviceModelType {
            switch model {
            case "iPhone10,3", "iPhone10,6", "iPhone11,2":
                return .iPhoneX
            case "iPhone11,4":
                return .iPhoneX_Max
            case "iPhone11,8":
                return .iPhoneXR
            default:
                return .other(model: model)
            }
        }
        
        static func ==(lhs: UIDeviceModelType, rhs: UIDeviceModelType) -> Bool {
            switch (lhs, rhs) {
            case (.iPhoneX, .iPhoneX):
                return true
            case (.iPhoneX_Max, .iPhoneX_Max):
                return true
            case (.iPhoneXR, .iPhoneXR):
                return true
            case (.other(let modelOne), .other(let modelTwo)):
                return modelOne == modelTwo
            default:
                return false
            }
        }
    }
    
    var simulatorModel: String? {
        guard TARGET_OS_SIMULATOR != 0 else { return nil }
        return ProcessInfo.processInfo.environment["SIMULATOR_MODEL_IDENTIFIER"]
    }
    
    var hardwareModel: String {
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let model = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        
        return model
    }
    
    var modelType: UIDeviceModelType {
        let model = self.simulatorModel ?? self.hardwareModel
        return UIDeviceModelType.type(from: model)
    }
    
    var isIPhoneX: Bool {
        return modelType == .iPhoneX
    }
    
    var isIPhoneXR: Bool {
        return modelType == .iPhoneXR
    }
    
    var isIPhoneX_Max: Bool {
        return modelType == .iPhoneX_Max
    }
    
    var isXFamily: Bool {
        return modelType == .iPhoneX_Max
            || modelType == .iPhoneX
            || modelType == .iPhoneXR
    }

}
