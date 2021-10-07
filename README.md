# DecentralizedMarketPlace
Decentralized MarketPlace

MarketPlace.sol (decentralized platform for buying and selling) in SOLIDITY
###DECENTRALIZED MARKETPLACE ON SOLIDITY###
###SOLIDITY VERSION###
Solidity version is >=0.8.0

###CONTRACT###
contract : Market

###DATA TYPES###
All data types including address, uint, int, events, struct, mapping, bool, string.

###FUNCTION SELLERS###
Function "sellers" will take 2 arguments i.e. string, uint, and will return 3 values i.e. string telling you that the product has been added for sale, Product Id telling you the byte code of your product along with your price and lastly the quantity of total products available for sale in the market.
at the same time it will emit the event for selling, and will add the selling data in the struct array of sell.

###FUNCTION BUYHERE###
Function "buyhere" will take 2 arguments i.e. string, uint, and will return 1 value i.e. bool, telling you that the product you want is available for sale or not. If the Product is available the there is another function ###DEAL### that will sell the desired product to the buyer and another function ###transfer### will transfer the amount of the product to the address of buyer.
at the same time it will emit the event for buying. Otherwise if the product is not available for sale then it will add the demanded product to the "Request lists" and will add the data in the struct array of buy.
