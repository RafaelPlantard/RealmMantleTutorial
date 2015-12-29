//
//  ArticleListResponseModel.h
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "MTLModel.h"
#import <Mantle/Mantle.h>
#import "ArticleModel.h"

@interface ArticleListResponseModel : MTLModel<MTLJSONSerializing>

/*! @brief A list of articles returned. */
@property (nonatomic, copy) NSArray *articles;

/*! @brief Status of this response. */
@property (nonatomic, copy) NSString *status;

/*! @brief Copyrights for using this article results.*/
@property (nonatomic, copy, readonly) NSString *copyright;

@end
