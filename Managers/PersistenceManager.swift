//
//  PersistenceManager.swift
//  GHFollowers
//
//  Created by Jenny Morales on 10/21/21.
//

import Foundation

enum PersistenceActionType {
    case add, remove
}

enum PersistenceManager {
    
    static private let defaults = UserDefaults.standard
    
    enum Keys {
        static let favorites = "favorites"
    }
    
    static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (GFError?) -> Void) {
        
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
    
    static func save(favorites: [Follower]) -> GFError? {
        do {
            let encodedFavorites = try JSONEncoder().encode(favorites)
            defaults.set(encodedFavorites, forKey: Keys.favorites )
            return nil
        } catch {
            return .unableToFavorite
        }
    }
    
}//End of enum
