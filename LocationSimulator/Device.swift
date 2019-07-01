//
//  Device.swift
//  LocationSimulator
//
//  Created by Watanabe Toshinori on 6/14/18.
//  Copyright © 2018 Watanabe Toshinori. All rights reserved.
//

import Cocoa
import CoreLocation

class Device: NSObject {
    
    private var UDID = ""
    
    // MARK: - Find Connected Device
    
    class func findConnectedDevice() -> Device? {
        let output = Process.execute("idevice_id -l")

        if output.isEmpty == false {
            let devices = output.components(separatedBy: CharacterSet.newlines)
            for uuid in devices where Process.execute("idevicepair validate -u \(uuid)").lowercased().contains("success") {
                print("paired device: \(uuid)")
                return Device(UDID: uuid)
            }
        }
        
        return nil
    }
    
    // MARK: - Initializing Device
    
    convenience init(UDID: String) {
        self.init()
        self.UDID = UDID
    }
    
    func mountDI() {
        let status = Process.execute("ideviceimagemounter -u \(UDID) -l")
        if status.lowercased().contains("imagesignature") {
            return
        }
        
        let output = Process.execute("ideviceinfo -s -k ProductVersion -u \(UDID)")
        let ver = output.components(separatedBy: ".").dropLast().joined(separator: ".")
        if let devDMG = Bundle.main.path(forResource: "DeveloperDiskImage", ofType: "dmg", inDirectory: ver),
            let devSign = Bundle.main.path(forResource: "DeveloperDiskImage.dmg", ofType: "signature", inDirectory: ver) {
            let mountStt = Process.execute("ideviceimagemounter -u \(UDID) \(devDMG) \(devSign)")
            print("Mount Status: \(mountStt)")
        } else {
            print("Cannot find files")
        }
    }
    
    // MARK: - Managing locations
    
    func simulateLocation(_ location: CLLocationCoordinate2D) {
        let lat = location.latitude
        let lng = location.longitude
        var command = "idevicelocation -u \(UDID)"
        switch (lat, lng) {
        case (..<0, ..<0): command += " -- \(lat) \(lng)"
        case (..<0, 0...): command += " -- \(lat) \(lng)"
        case (0..., ..<0): command += " \(lat) -- \(lng)"
        default:           command += " \(lat) \(lng)"
        }
        
        let output = Process.execute(command)
        print(output)
    }
    
    func disableSimulation() {
        let output = Process.execute("idevicelocation -s -u \(UDID)")
        print(output)
    }

}
