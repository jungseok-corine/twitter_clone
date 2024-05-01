//
//  Constatns.swift
//  twitter_clone
//
//  Created by 오정석 on 10/4/2024.
//

import Firebase

let STORAGE_REF = Storage.storage().reference()
let STORAGE_PROFILE_IMAGES = STORAGE_REF.child("profile_images")

let DB_REF = Database.database().reference()
let REF_USERS = DB_REF.child("users")
let REF_TWEETS = DB_REF.child("tweets")
let REF_USER_TWEETS = DB_REF.child("user-tweets")
let REF_USER_FOLLWERS = DB_REF.child("user-followers")
let REF_USER_FOLLWING = DB_REF.child("user-following")
