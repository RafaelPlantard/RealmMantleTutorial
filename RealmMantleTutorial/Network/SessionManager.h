//
//  SessionManager.h
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "AFHTTPSessionManager.h"

/*! @brief It's a singleton object that will we use to perform requests to the API. */
@interface SessionManager : AFHTTPSessionManager

/*! @brief Creates and maintain the singleton for this object. */
+ (id)sharedManager;

@end
