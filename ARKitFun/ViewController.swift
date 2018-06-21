//
//  ViewController.swift
//  ARKitFun
//
//  Created by Tyler Frith on 6/21/18.
//  Copyright © 2018 Coty. All rights reserved.
//

import UIKit
import ARKit

class ViewController: UIViewController {

    @IBOutlet weak var sceneView: ARSCNView!
    
    let configuration = ARWorldTrackingConfiguration()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create session
        self.sceneView.session.run(configuration)
        
        //add debug options
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        
        //create and add node
        let node = SCNNode()
        node.geometry = SCNBox(width: 0.1, height: 0.1, length: 0.1, chamferRadius: 0)
        node.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
        node.position = SCNVector3(0,0,-0.5)
        node.scale = SCNVector3(1.5, 1.5, 1.5)
        
        self.sceneView.scene.rootNode.addChildNode(node)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //test
}


