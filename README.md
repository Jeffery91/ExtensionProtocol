# ImplementationProtocol

	@protocol Printable

	- (void)print;

	@end

	@implementationProtocol(Printable)

	- (void)print {
    	NSLog(@"Default print");
	}

	@end