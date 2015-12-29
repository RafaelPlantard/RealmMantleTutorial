//
//  ArticleListRequestModel.h
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "Mantle.h"
#import "MTLModel.h"

/*! @brief The request model for get articles from New York Times Article Search API. */
@interface ArticleListRequestModel : MTLModel<MTLJSONSerializing>

/*! @brief Search query term. Search is performed on the article body, headline and byline. */
@property (nonatomic, copy) NSString *query;

/*! 
 @brief Restricts responses to results with publication dates of the date specified or later.
 @remark The pattern for date is: YYYYMMDD.
 */
@property (nonatomic, copy) NSDate *articlesFromDate;

/*! 
 @brief Restricts responses to results with publication dates of the date specified or earlier.
 @remark The pattern for date is: YYYYMMDD.
 */
@property (nonatomic, copy) NSDate *articlesToDate;

/*! @brief The current date formatter. */
+ (NSDateFormatter *)dateFormatter;

@end