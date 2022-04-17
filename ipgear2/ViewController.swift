//
//  ViewController.swift
//  ipgear2
//
//  Created by cch on 2022/4/17.
//

import Cocoa
import SwiftPublicIP
class ViewController: NSViewController {

    @IBOutlet weak var iplabel: NSTextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.iplabel.stringValue="Acquiring..."
        getip(cb: { [self]
            (string, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let string = string {
                    print(string) // Your IP address
                    self.iplabel.stringValue=string
                }
        })
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
     func getip(cb: @escaping (String?, Error?) -> Void) {
         SwiftPublicIP.getPublicIP(url: PublicIPAPIURLs.IPv4.icanhazip.rawValue,completion: cb)
        
    }
    @IBAction func refreship(_ sender: Any)    {
        self.iplabel.stringValue="Acquiring..."
        getip(cb: { [self]
            (string, error) in
                if let error = error {
                    print(error.localizedDescription)
                } else if let string = string {
                    print(string) // Your IP address
                    self.iplabel.stringValue=string
                }
        })
    }

}

