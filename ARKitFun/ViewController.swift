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
    var addedPath = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //create session
        configuration.planeDetection = .horizontal
        self.sceneView.session.run(configuration)
        
        //add debug options
        self.sceneView.debugOptions = [ARSCNDebugOptions.showFeaturePoints]
        self.sceneView.showsStatistics = true
        self.sceneView.session.delegate = self
        self.sceneView.delegate = self
        
        // Prevent dimming
        UIApplication.shared.isIdleTimerDisabled = true
        
        // Update the camera settings
        setupCamera()
        
        //create and add node
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        sceneView.session.pause()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupCamera() {
        guard let camera = sceneView.pointOfView?.camera else {
            fatalError("Expected a valid `pointOfView` from the scene.")
        }
        
        /*
         Enable HDR camera settings for the most realistic appearance
         with environmental lighting and physically based materials.
         */
        camera.wantsHDR = true
        camera.exposureOffset = -1
        camera.minimumExposure = -1
        camera.maximumExposure = 3
    }
}

// MARK: - ARSCNViewDelegate Methods
extension ViewController: ARSCNViewDelegate, ARSessionDelegate {
    
    func renderer(_ renderer: SCNSceneRenderer, didAdd node: SCNNode, for anchor: ARAnchor) {
        // Place content only for anchors found by plane detection.
        guard let _ = anchor as? ARPlaneAnchor else { return }
        
        print("Possibly found plane")
        if !addedPath {
            
            // Add the start path
            let nodePath1 = SCNNode()
            nodePath1.geometry = SCNCylinder(radius: 0.25, height: 3.0)
            nodePath1.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
            nodePath1.position = SCNVector3(0, 0, -0.5)
            nodePath1.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath1.position = SCNVector3(0, 0, 0)
            nodePath1.opacity = 0.9
            
            node.addChildNode(nodePath1)
            
            // add the right path 15m
            let nodePath2 = SCNNode()
            nodePath2.geometry = SCNCylinder(radius: 0.25, height: 12.0)
            nodePath2.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
            nodePath2.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath2.rotation = SCNVector4(0, 0, 1, (Double.pi/2))
            nodePath2.position = SCNVector3(-6.0, 0.0, -1.5)
            nodePath2.opacity = 0.9
            node.addChildNode(nodePath2)
            
            // Add 7m
            let nodePath3 = SCNNode()
            nodePath3.geometry = SCNCylinder(radius: 0.25, height: 5.0)
            nodePath3.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
            nodePath3.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath3.rotation = SCNVector4(0, 0, 1, (Double.pi/2))
            nodePath3.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath3.position = SCNVector3(-12.0, 0.0, 1.0)
            nodePath3.opacity = 0.9
            node.addChildNode(nodePath3)
            
            let nodePath4 = SCNNode()
            nodePath4.geometry = SCNCylinder(radius: 0.25, height: 2.0)
            nodePath4.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
            nodePath4.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath4.rotation = SCNVector4(0, 0, 1, (Double.pi/2))
            nodePath4.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath4.rotation = SCNVector4(0, 0, 1, (Double.pi/2))
            nodePath4.position = SCNVector3(-11.0, 0.0, 3.5)
            nodePath4.opacity = 0.9
            node.addChildNode(nodePath4)
            
            let nodePath5 = SCNNode()
            nodePath5.geometry = SCNCylinder(radius: 0.25, height: 9.0)
            nodePath5.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
            nodePath5.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath5.rotation = SCNVector4(0, 0, 1, (Double.pi/2))
            nodePath5.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
            nodePath5.position = SCNVector3(-10.0, 0.0, 8.0)
            nodePath5.opacity = 0.9
            node.addChildNode(nodePath5)
            
            addedPath = true
        } else {
            print("found nodes already")
        }

    }
    
    func renderer(_ renderer: SCNSceneRenderer, didUpdate node: SCNNode, for anchor: ARAnchor) {
        
        // possibly change how it twists here
        
        // Place content only for anchors found by plane detection.
//        guard let _ = anchor as? ARPlaneAnchor else { return }
//
//        print("Possibly found plane")
//        if !addedPath {
//
//            // Add the start path
//            let nodePath1 = SCNNode()
//            nodePath1.geometry = SCNCylinder(radius: 0.25, height: 3.0)
//            nodePath1.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
//            nodePath1.position = SCNVector3(0, 0, -0.5)
//            nodePath1.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
//            nodePath1.position = SCNVector3(0, 0, 0)
//            nodePath1.opacity = 0.9
//
//            node.addChildNode(nodePath1)
//
//            // add the right path 15m
//            let nodePath2 = SCNNode()
//            nodePath2.geometry = SCNCylinder(radius: 0.25, height: 15.0)
//            nodePath2.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
//            nodePath2.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
//            nodePath2.rotation = SCNVector4(0, 0, 1, (Double.pi/2))
//            nodePath2.position = SCNVector3(-7.5, 0.0, -1.5)
//            nodePath2.opacity = 0.9
//            node.addChildNode(nodePath2)
//
//            // Add 7m
//            let nodePath3 = SCNNode()
//            nodePath3.geometry = SCNCylinder(radius: 0.25, height: 7.0)
//            nodePath3.geometry?.firstMaterial?.diffuse.contents = UIColor.purple
//            nodePath3.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
//            nodePath3.rotation = SCNVector4(0, 0, 1, (Double.pi/2))
//            nodePath3.rotation = SCNVector4(1, 0, 0, (Double.pi/2))
//            nodePath3.position = SCNVector3(-12.0, 0.0, 2.0)
//            nodePath3.opacity = 0.9
//            node.addChildNode(nodePath3)
//
//            addedPath = true
//        } else {
//            print("found nodes already")
//        }
    }
}

// MARK: - Private Methods
extension ViewController {
    @IBAction private func resetTracking() {
        let configuration = ARWorldTrackingConfiguration()
        configuration.planeDetection = .horizontal
        sceneView.session.run(configuration, options: [.resetTracking, .removeExistingAnchors])
        addedPath = false
    }
}
