//
//  ViewController.swift
//  iOS-client
//
//  Created by Arnaud Schloune on 13/10/15.
//  Copyright © 2015 arnaudschloune. All rights reserved.
//

import UIKit

class ViewController: UIViewController, AsyncClientDelegate {
    
    let client = AsyncClient()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(animated: Bool) {
        
        client.serviceType = "_ClientServer._tcp"
        client.delegate = self
        client.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func tapButton(sender: UIButton) {
        client.sendObject(sender.titleLabel?.text)
    }
    
    
    func client(theClient: AsyncClient!, didFindService service: NSNetService!, moreComing: Bool) -> Bool {
        
        print("didFindService")
        print(service)
        return true
    }
    
    func client(theClient: AsyncClient!, didRemoveService service: NSNetService!) {
        
        print("didRemoveService")
        print(theClient)
    }
    
    func client(theClient: AsyncClient!, didConnect connection: AsyncConnection!) {
        
        print("didConnect")
        print(theClient)
    }
    
    func client(theClient: AsyncClient!, didDisconnect connection: AsyncConnection!) {
        print("diddisconnect")
        print(theClient)
    }
    
    func client(theClient: AsyncClient!, didReceiveCommand command: AsyncCommand, object: AnyObject!, connection: AsyncConnection!) {
        print("didreceivecommand")
        print(command)
    }
    
    func client(theClient: AsyncClient!, didFailWithError error: NSError!) {
        print("didfailwitherror")
    }


}

