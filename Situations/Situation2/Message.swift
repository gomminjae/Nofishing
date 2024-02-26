//
//  File.swift
//  
//
//  Created by 권민재 on 2/13/24.
//

import Foundation


struct Message: Hashable,Identifiable{
    var id = UUID()
    var content: String
    var isCurrentUser: Bool
    var linkMessage: String?
}

struct MessageData {
    
    
    
    static let introMessages = [
        Message(content: "Hi, I'm Mr. Fisher, a phishing expert", isCurrentUser: false),
        Message(content: "Hello!", isCurrentUser: true),
        Message(content: "You know that there are a lot of phishing crimes in Korea these days, right?", isCurrentUser: false),
        Message(content: "That's right. I've been getting a lot of text messages or links to numbers that I don't know", isCurrentUser: true),
        Message(content: "That's right, so I'm going to teach you the types and prevention of phishing from now on", isCurrentUser: false),
        Message(content: "All right, Mr. Fisher", isCurrentUser: true)
    ]
    static let privacyPolicyMessage = [
        Message(content: "What we're going to learn this time is a privacy policy and Please take a look at the above image, it outlines important elements of online security. Please read it and keep it in mind", isCurrentUser: false),
        Message(content: "Privacy policies are important documents that protect users' personal information and define service providers' obligations and responsibilities. Reading them is very important for the following", isCurrentUser: false),
        Message(content: "Tap the document on the upper right to read it", isCurrentUser: false),
        Message(content: "I read all of them", isCurrentUser: true),
        Message(content: "Before signing up for membership, you should read the personal information processing policy and not sign up if it is strange or suspected of infringement of personal information", isCurrentUser: false),
        Message(content: "Please make sure to read the Privacy Policy before proceeding with the registration. Shall we move on to the next step?", isCurrentUser: false)
        
    ]
    
    
    static let linkgMessages = [
        Message(content: "Please click on the link given for the next learning!!", isCurrentUser: false,linkMessage: "http://nofishing.com")
        
    ]
    
    static let messengerPhishing: [Message] = [
        Message(content: "Mom, my phone screen is broken, so I came to the store to repair it, this is a temporary phone. I can't talk on the phone, so text me", isCurrentUser: false),
        Message(content: "Is it badly broken?", isCurrentUser: true),
        Message(content: "I'm trying to insure the repair, but I can't verify it with my phone right now. Please tell me your ID card, account number and password", isCurrentUser: false)
    ]
}
