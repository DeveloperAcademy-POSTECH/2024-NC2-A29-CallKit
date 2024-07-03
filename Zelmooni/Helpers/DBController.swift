//
//  DBController.swift
//  Zelmooni
//
//  Created by 문인범 on 6/27/24.
//


import FirebaseFirestore
import Foundation



final class DBController {
    let db = Firestore.firestore()
    
    public func registryToken(_ device: String) async {
        do {
            let document = try await db.collection("device").document(device).getDocument()
            
            if !document.exists {                
                try await db.collection("device").document(device).setData([
                    "token": device,
                    "is_enabled": true
                ])
            }
        } catch {
            print("registry Token Error, \(error.localizedDescription)")
        }
    }
    
    public func getEnableData() async -> Bool? {
        guard let path = UserDefaults.standard.string(forKey: UserDefaults.token) else {
            return nil
        }
        
        do {
            let document = try await db.collection("device").document(path).getDocument()
            
            guard let isEnabled = document.get("is_enabled") as? Bool else {
                print("here?")
                return nil
            }
            
            return isEnabled
        } catch {
            print("get data error, \(error.localizedDescription)")
            return nil
        }
    }
    
    public func updateData(_ isEnabled: Bool) async {
        guard let path = UserDefaults.standard.string(forKey: UserDefaults.token) else {
            return
        }
        
        do {
            try await db.collection("device").document(path).updateData(["is_enabled": isEnabled])
        } catch {
            print("update data error, \(error.localizedDescription)")
        }
    }
}
