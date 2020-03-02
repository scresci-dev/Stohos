//
//  DatabaseHelper.swift
//  MC3
//
//  Created by Silvio Cresci on 02/03/2020.
//  Copyright © 2020 Gianna Stylianou. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class DatabaseHelper{
    static let istance = DatabaseHelper()
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    func saveThoughtCoredata(text: String, evaluation: String){
        let thought = NSEntityDescription.insertNewObject(forEntityName: "Thought", into: context) as! Thought
        thought.text = text
        thought.evaluation = evaluation
        do{
            try context.save()
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func getAllThoughts() -> [Thought]{
        var arrThought = [Thought]()
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Thought")
        do{
            arrThought = try context.fetch(fetchRequest) as! [Thought]
        } catch let error{
            print(error.localizedDescription)
        }
        return arrThought
    }
    
   func clearCoreData() {
       // Create Fetch Request
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Thought")

        // Create Batch Delete Request
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)

        do {
            try context.execute(batchDeleteRequest)

        } catch {
            // Error Handling
        }
    }
    
    func updateThoughts(oldText: String, newText :String, newEvaluation: String){
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        
        let managedContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest.init(entityName: "Thought")
        fetchRequest.predicate = NSPredicate(format: "text = %@", oldText)
        do{
            let test = try managedContext.fetch(fetchRequest)
            
            let objectUpdate = test[0] as! NSManagedObject
            objectUpdate.setValue("text", forKey: newText)
            objectUpdate.setValue("evaluation", forKey: newEvaluation)
            do{
                try managedContext.save()
            }
            catch{
                print(error)
            }
        }
        catch{
            print(error)
        }
        
    }
}
