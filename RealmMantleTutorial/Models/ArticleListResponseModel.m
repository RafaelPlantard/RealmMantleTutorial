//
//  ArticleListResponseModel.m
//  RealmMantleTutorial
//
//  Created by Rafael Ferreira on 12/28/15.
//  Copyright © 2015 Data Empire. All rights reserved.
//

#import "ArticleListResponseModel.h"

@implementation ArticleListResponseModel

#pragma mark - Mantle JSONKeyPathsByPropertyKey

+ (NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"articles": @"response.docs",
             @"status": @"status",
             @"copyright": @"copyright"
             };
}

#pragma mark - JSON Transformer

+ (NSValueTransformer *) articlesJSONTransformer {
    return [MTLJSONAdapter arrayTransformerWithModelClass:ArticleModel.class];
}

@end
