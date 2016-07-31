# ImplementationProtocol

[协议的默认实现](http://www.jianshu.com/p/1d8d632ecf24)

	@protocol Printable

	- (void)print;

	@end

	@implementationProtocol(Printable)

	- (void)print {
    	NSLog(@"Default print");
	}

	@end