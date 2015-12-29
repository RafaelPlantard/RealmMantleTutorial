//
//  ArticleRealm.h
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import <Realm/RLMObject.h>
#import "ArticleModel.h"

@interface ArticleRealm : RLMObject

/*! @brief Represents the first paragraph from the article. */
@property NSString *leadParagraph;

/*! @brief Represents the web url for this article. */
@property NSString *url;

/*! @brief Initializes a article realm from a model based on Mantle object. */
- (id)initWithMantleModel:(ArticleModel *)articleModel;

@end