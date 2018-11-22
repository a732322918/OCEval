//
//  OCControlTest.m
//  OCParserTest
//
//  Created by sgcy on 2018/11/17.
//  Copyright © 2018年 sgcy. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "OCEval.h"


@interface OCControlTest : XCTestCase

@end

@implementation OCControlTest


- (void)testIf{
    NSString *inputStr = @"{    NSString *str = [NSString string];\
    if (str.length == 0) {\
    return str;\
    }}";
    NSString *result = [OCEval eval:inputStr];
    NSAssert([result isEqualToString:@""], nil);
}

- (void)testIfElse{
    NSString *inputStr = @"{    NSString *str = [NSString string];\
    if (str.length == 2) {\
    return nil;\
    }else if(str.length == 0){\
    return str;\
    }}";
    NSString *result = [OCEval eval:inputStr];
    NSAssert([result isEqualToString:@""], nil);
}


- (void)testElseIf{
    NSString *inputStr = @"{    NSString *str = [NSString string];\
    if (str.length == 2) {\
    return nil;\
    }else if(str.length == 0){\
    return str;\
    }else{}}";
    NSString *result = [OCEval eval:inputStr];
    NSAssert([result isEqualToString:@""], nil);
}

- (void)testDoWhile{
    NSString *inputStr = @"{    int j = 4;\
    do {\
        i = i + 1;\
    } while (i < 10);\
    return i;}";
    NSNumber *result = [OCEval eval:inputStr];
    NSAssert(result.integerValue == 10, nil);
}

- (void)testWhileDo{
    NSString *inputStr = @"{    int i = -4;\
    while (i < 10) do {\
        i = i + 1;\
    }\
    return i;}";
    NSNumber *result = [OCEval eval:inputStr];
    NSAssert(result.integerValue == 10, nil);
}

- (void)testForIn{

    NSString *inputStr = @"{     NSArray *nums = @[@(1),@(2),@(3)];\
    NSInteger value = 0;\
    for (NSNumber *num in nums) {\
        value = value + num;\
    }\
    return value;}";
    NSNumber *result = [OCEval eval:inputStr];
    NSAssert(result.integerValue == 6, nil);
}

- (void)testFor{
    NSString *inputStr = @"{     NSArray *nums = @[@(1),@(2),@(3)];\
    int j = -4;\
    for (int i = 0; i< nums.count; i = i + 1) {\
        j = j + i;\
    }\
    return j;}";
    NSNumber *result = [OCEval eval:inputStr];
    NSAssert(result.integerValue == -1, nil);
    //TODO i++,i+=1
}

@end
