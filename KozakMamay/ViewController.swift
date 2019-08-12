//
//  ViewController.swift
//  KozakMamay
//
//  Created by Danil Kurilo on 07/08/2019.
//  Copyright © 2019 Danil Kurilo. All rights reserved.
//

import UIKit
import Foundation
import ARKit

class ViewController: UIViewController, ARSCNViewDelegate {

    @IBOutlet var sceneView: ARSCNView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Set the view's delegate
        sceneView.delegate = self
        
        // Show statistics such as fps and timing information
        sceneView.showsStatistics = false
        
        // Create a new scene
        //let scene = SCNScene(named: "art.scnassets/ship.scn")!
        
        // Set the scene to the view
        //sceneView.scene = scene
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        let configuration = ARImageTrackingConfiguration()
        
        if let trackedImage = ARReferenceImage.referenceImages(inGroupNamed: "KozakImage", bundle: Bundle.main) {
            
            configuration.trackingImages = trackedImage
            configuration.maximumNumberOfTrackedImages = 1
            
        }
        // Run the view's session
        sceneView.session.run(configuration)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Pause the view's session
        sceneView.session.pause()
    }

    // MARK: - ARSCNViewDelegate
    

    func renderer(_ renderer: SCNSceneRenderer, nodeFor anchor: ARAnchor) -> SCNNode? {
        
        let node = SCNNode()
        
        
        if let imageAnchor = anchor as? ARImageAnchor {
            
            
            let imageName = imageAnchor.referenceImage.name!
            let physicalSizeOfReferenceImage = CGSize(width: imageAnchor.referenceImage.physicalSize.width, height: imageAnchor.referenceImage.physicalSize.height)
            var preferredWidth: CGFloat = imageAnchor.referenceImage.physicalSize.width
            var preferredHeight: CGFloat = imageAnchor.referenceImage.physicalSize.height
            
            print("""
                Detected AnchorID = \(imageAnchor.identifier)
                Detected Reference Image Name = \(imageName)
                Detected Reference Image Physical Size = (width) \(physicalSizeOfReferenceImage.width),
                Detected Reference Image Physical Size = (height) \(physicalSizeOfReferenceImage.height)
                """)
            
            
            let videoNode = SKVideoNode(fileNamed: "video.mp4")
            
            videoNode.play()
            
            
            let videoScene = SKScene(size: CGSize(width: 1400, height: 1198))
            
            videoNode.position = CGPoint(x: videoScene.size.width / 2, y: videoScene.size.height / 2)
            videoNode.yScale = -1.0
            
            videoScene.addChild(videoNode)
            
            
            
            let plane = SCNPlane(width: preferredWidth, height: preferredHeight)
            //plane.materials = []
            
            
            plane.firstMaterial?.diffuse.contents = videoScene
            
            let planeNode = SCNNode(geometry: plane)
            
            planeNode.eulerAngles.x = -.pi / 2
            
            node.addChildNode(planeNode)
            
        }
        
        return node
        
    }
    
    
    
    
    func session(_ session: ARSession, didFailWithError error: Error) {
        // Present an error message to the user
        
    }
    
    func sessionWasInterrupted(_ session: ARSession) {
        // Inform the user that the session has been interrupted, for example, by presenting an overlay
        
    }
    
    func sessionInterruptionEnded(_ session: ARSession) {
        // Reset tracking and/or remove existing anchors if consistent tracking is required
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
