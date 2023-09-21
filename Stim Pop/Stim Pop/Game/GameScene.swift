//
//  GameScene.swift
//  test
//
//  Created by Fabrizio Narciso on 06/04/23.
//
import CoreMotion //Track the motion
import SpriteKit
import AVKit
import SwiftUI


class Ball: SKSpriteNode {}
var ballsList = ["b1","b2","b3","b4","b5","b6"]

class GameScene: SKScene {
    
    @AppStorage("highscore") var highscore: Int = 0
    //Skin
    var index: Int = 0
    
    //Mode
    var game: Bool = false
    
    //Ball Characteristics
    var BallSize:CGFloat = 0.15
    var BallBounce:CGFloat = 0
    var BallFriction: CGFloat = 0
    

    
    //Points
    var counter = 0
    let Points = SKLabelNode(fontNamed: "SF Pro")
    var points = 0 {
        didSet {
            let formPoints = NumberFormatter().string(from: points as NSNumber) ?? "0"
            Points.text = "\(formPoints)"
        }
    }
    let High = SKLabelNode(fontNamed: "SF Pro")
    var high = 0 {
        didSet {
            let formHigh = NumberFormatter().string(from: high as NSNumber) ?? "0"
            High.text = "\(formHigh)"
        }
    }
    
    //pop sound
    lazy var pop: SKAction = {
        return SKAction.playSoundFileNamed("pop", waitForCompletion: false)
    }()
    
    //Vibration
    let generator = UINotificationFeedbackGenerator()
    
    override func didMove(to view: SKView) {
        
        //Background
        let board  = SKSpriteNode()
        board.scale(to: size)
        board.position = CGPoint(x: frame.midX, y: frame.midY)
        board.zPosition = -1
        addChild(board)
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame.inset(by: UIEdgeInsets(top: 35, left: 0, bottom: 0, right: 0)))
        
        //Points
        Points.fontSize = 48
        Points.position = CGPoint(x: frame.maxX - 10, y: frame.maxY - 90)
        Points.text = "0"
        Points.zPosition = 10
        Points.horizontalAlignmentMode = .right
        if game == true {
            addChild(Points)
        }
        //High Score
        High.fontSize = 24
        High.fontColor = .gray
        High.horizontalAlignmentMode = .right
        High.position = CGPoint(x: Points.position.x, y: Points.position.y - 22)
        High.text = "HighScore"
        High.zPosition = 10
        if game == true {
            addChild(High)
        }
        
        //Ball size reference
        let ball = SKSpriteNode(imageNamed: "b1")
        ball.xScale = CGFloat(BallSize)
        ball.yScale = CGFloat(BallSize)
        
        //Ball placement
        for i in stride(from: ball.frame.width/2, to: view.bounds.width - ball.frame.width/2, by: ball.frame.width) {
            for j in stride(from: 35, to: view.bounds.height - ball.frame.width/2, by: ball.frame.height) {
                if let ballColor = ballsList.randomElement() {
                    let ball = Ball(imageNamed: ballColor)
                    ball.xScale = CGFloat(BallSize)
                    ball.yScale = CGFloat(BallSize)
                    ball.position = CGPoint(x: i, y: j)
                    ball.name = ballColor
                    
                    ball.physicsBody = SKPhysicsBody(circleOfRadius: ball.frame.width/2)
                    ball.physicsBody?.allowsRotation = false
                    ball.physicsBody?.restitution = CGFloat(BallBounce)
                    ball.physicsBody?.friction =  CGFloat(BallFriction)
                    
                    counter += 1
                    addChild(ball)
                }
                
            }
            
        }
        
        //For motion tracking
        motionManager = CMMotionManager()
        motionManager?.startAccelerometerUpdates()

    }
    

    
    //Checks the valid distance with the hipotenuse for matching
    func distance(from: Ball, to: Ball) -> CGFloat {
        return (from.position.x - to.position.x) * (from.position.x - to.position.x) + (from.position.y - to.position.y) * (from.position.y - to.position.y)
    }
    
    //For the getMaches func
    var matchedBall = Set<Ball>()
    
    // Checks if tapped color has matches
    func getMatches(from startBall: Ball) {
        let matchWidth = startBall.frame.width * startBall.frame.width * 1.2
        
        for node in children {
            guard let ball = node as? Ball else {continue}
            guard ball.name == startBall.name else {continue}
            
            let dist = distance(from: startBall, to: ball)
            guard dist < matchWidth else {continue}
            
            if !matchedBall.contains(ball) {
                matchedBall.insert(ball)
                getMatches(from: ball)
            }
        }
    }
    
    
    //Deletes matched balls
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        
        guard let position = touches.first?.location(in: self) else { return }
        guard let tappedball = nodes(at: position).first(where: { $0 is Ball}) as? Ball else { return }
        
        matchedBall.removeAll(keepingCapacity: true)
        
        getMatches(from: tappedball)
        
        points += Int(pow(2, Double(min(matchedBall.count, 16))))
        counter -= matchedBall.count
        if game == true {
            if points > highscore {
                highscore = points
                high = points
            } else {
                high = highscore
            }
        }
            //Pop effect
            for ball in matchedBall {
                if let particles = SKEmitterNode(fileNamed: "POP") {
                    particles.position = ball.position
                    addChild(particles)
                    run(pop)
                    generator.notificationOccurred(.success)
                    
                    let remove = SKAction.sequence([SKAction.wait(forDuration: 2),SKAction.removeFromParent()])
                    particles.run(remove)
                }
                ball.removeFromParent()

            }
        
    }
    
    //Rotation
    var motionManager: CMMotionManager? 
    override func update(_ currentTime: TimeInterval) {
        if let accel_Data = motionManager?.accelerometerData {
            physicsWorld.gravity = CGVector(dx: accel_Data.acceleration.x * 55, dy: accel_Data.acceleration.y * 55) //55 sets the intensity
        }
        if counter <= 0 {
            let end = SKLabelNode(fontNamed: "helvetica")
            end.fontSize = 36
            end.position = CGPoint(x: frame.midX, y: frame.midY)
            end.text = "Go back to play again."
            end.zPosition = 10
            addChild(end)
        }
    }
    
}
