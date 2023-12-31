//
//  GameView.swift
//  POP
//
//  Created by Fabrizio Narciso on 10/04/23.
//
import SwiftUI
import SpriteKit

struct GameView: View {
    
    
    let BallSize: CGFloat
    let BallBounce: CGFloat
    let BallFriction: CGFloat
    let index: Int
    let mode: Bool
    
    init(BallSize: CGFloat, BallBounce: CGFloat, BallFriction: CGFloat, index: Int, mode: Bool) {
        self.BallSize = BallSize
        self.BallBounce = BallBounce
        self.BallFriction = BallFriction
        self.index = index
        self.mode = mode
    }
    
    var body: some View {
      
            VStack {
                sceneView()
                    .ignoresSafeArea()
            }
        
    }
    
    func sceneView() -> some View {
        let scene = SKScene(fileNamed: "GameScene")
        if let scene  = scene as? GameScene {
            //Sets values
            scene.BallSize = BallSize
            scene.BallBounce = BallBounce
            scene.BallFriction = BallFriction
            scene.index = index
            scene.game = mode
            
            return SpriteView(scene: scene)
        } else {
           return SpriteView(scene: SKScene())
        }
    }
}

