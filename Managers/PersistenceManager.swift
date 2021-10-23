//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Jenny Morales on 10/21/21.
//

import Foundation

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func retrieveFavorites(completed: @escaping (Result<[Follower], GFError>) -> Void) {
        guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
            return completed(.success([]))
        }
        
        do {
            let favorites = try JSONDecoder().decode([Follower].self, from: favoritesData)
            completed(.success(favorites))
        } catch {
            completed(.failure(.unableToComplete))
        }
    }
    
    static func save(favorites: [Follower]-> GFError?) {
        do {
            let encodedFavorites = try JSONEncoder().encode(favorites)
            return nil
        } catch {
            print("Error in \(#function)\(#line) : \(error.localizedDescription) \n---\n \(error)")
            return
        }
    }
    
}//End of enum
