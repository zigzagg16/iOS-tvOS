//
//  FirstViewController.swift
//  tvOS-Server
//
//  Created by Arnaud Schloune on 13/10/15.
//  Copyright © 2015 arnaudschloune. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, AsyncServerDelegate {

    @IBOutlet weak var labelHello: UILabel!
    
    let server = AsyncServer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        server.serviceType = "_ClientServer._tcp"
        server.serviceName = "tvOS"
        
        server.delegate = self
        server.start()
    }
    
    
    func server(theServer: AsyncServer!, didConnect connection: AsyncConnection!) {
        print("didconnect")
        print(connection)
    }
    
    func server(theServer: AsyncServer!, didReceiveCommand command: AsyncCommand, object: AnyObject!, connection: AsyncConnection!) {
        print("didreceivecommand")
        print(command)
        print(object)
        labelHello.text = object as? String
    }
    
    func server(theServer: AsyncServer!, didDisconnect connection: AsyncConnection!) {
        print("disconnected server")
    }
    
    func server(theServer: AsyncServer!, didFailWithError error: NSError!) {
        print("didfail")
    }
    
//    func server(theServer: AsyncServer!, didReceiveCommand command: AsyncCommand, object: AnyObject!, connection: AsyncConnection!, responseBlock block: AsyncNetworkResponseBlock!) {
//        print("didreceivecommand - response block")
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

