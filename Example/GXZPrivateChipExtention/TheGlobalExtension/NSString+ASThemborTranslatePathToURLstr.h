//
//  NSString+ASThemborTranslatePathToURLstr.h
//  AVarSha
//
//  Created by MD_GAO on 11/4/15.
//  Copyright © 2015 MD_GAO. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (ASThemborTranslatePathToURLstr)


-(NSString*)getASThemborTranslatePathToURLstrOfSize:(CGSize)imageSize;
-(NSString*)getASThemborTranslatePathToURLstrOfSize:(CGSize)imageSize with:(CGRect)crop;

@end
