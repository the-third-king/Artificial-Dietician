//
//  UIViewAlert.swift
//  Artificial-Dietician
//
//  Created by Cameron Triplett on 4/13/21.
//

import UIKit
import MongoSwift
import StitchCore
import StitchRemoteMongoDBService

class ViewController: UIViewController{
    override func viewDidLoad(){
        /*
         let client = try! Stitch.initializeDefaultAppClienwithClientAppIDID: "artificial-dietician-dltly")
        
        let mongoClient = client.serviceClient(
            fromFactory: remoteMongoClientFactory,
            withName: "mongodb-atlas"
        )
        
        let coll = mongoClient.db("<DATABASE>").collection("<COLLECTION>")
        
        client.auth.login(withCredential: AnonymousCredential()) { result in
            switch result {
            case .success(let user):
                coll.updateOne(
                    filter: ["owner_id": user.id],
                    update: ["number": 42, "owner_id": user.id],
                    options: RemoteUpdateOptions(upsert: true)
                ) { reuslt in
                    switch result {
                    case.success:
                        coll.find().asArray({ result in
                            switch result {
                            case .success(let result):
                                print("Found documents:")
                                
                                result.forEach( {document in
                                    print(document.canonicalExtendedJSON)
                                })
                            case .failure(let error):
                                print("Error in finding documents: \(error)")
                            }
                        })
                    case .failure(let error):
                        print("Error updating or inserting a document: \(error)")
                    }
                }
            case .failure(let error):
                print("Error in login: \(error)")
            }
        }
 */
    }
}
