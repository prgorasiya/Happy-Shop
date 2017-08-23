# Happy-Shop
This app requires minimum iOS deployment target of 9.0

Anyone can run this app in iOS simulator using latest version of XCode and this app doesn't require any special setup to run on different Mac machine.

This app contains 3 different screen as follows
Home screen (Category screen)
Product listing screen
Product details screen

Home screen — 
	
   - Here there is a tableview which displays static 4 product categories
	- User can see products from any category
	- User can see total products added to cart from the badge to right navigation bar 	  button

Product listing screen —

   - User can see list of products from selected category from home screen
	- Loading of products is paginated, so as user scrolls new products will be fetched

Product details screen —
   - User can select any product from previous product listing screen and navigate to product details screen
	- User can see all the details received from API on this screen
	- User can add the product to cart but there is no separate screen for showing cart

**Note:** For demo purpose I have used UserDefaults to store product IDs to retrieve product count added to cart but Realm or core database can be implemented if add to cart feature is extended to separate cart screen with full features of a cart

**Known issue:** Currently API for fetching product assets is throwing me some access denied error so I am not able to download actual product’s image. So, you may see a placeholder image for each and every product in product listing as well as product details screen
