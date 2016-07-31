//
//  ImplementationProtocol.h
//
//  Created by Jianfei.zhang on 2016-7-31.
//  Copyright (c) 2016年 dianping.com. All rights reserved.
//

#define implementationProtocol(NAME) \
interface NAME ## TemporaryClass : NSObject < NAME > {} \
@end \
@implementation NAME ## TemporaryClass \
\
