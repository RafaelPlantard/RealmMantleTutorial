//
//  ArticleModel.h
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>

@interface ArticleModel : MTLModel<MTLJSONSerializing>

/*! @brief The first paragraph from the article. */
@property (nonatomic, copy) NSString *leadParagraph;

/*! @brief The url for the complete article. */
@property (nonatomic, copy) NSString *url;

@end
