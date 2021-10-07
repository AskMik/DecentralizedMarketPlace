
pragma solidity >= 0.8.0;
contract Market {
    address payable to = SellerAddress;
    address payable from = addressId;
    address payable addressId;
    address payable SellerAddress;
    uint productId;
    uint productCheck;
    uint RequestsLists= 0;
    uint256 TotalProducts = 0;
    int i = -1;
    uint[] SellingIds;
    uint[] BuyingIds;
    event ProductAddedForSale(
        uint date,
        address From,
        string Name,
        uint amount
    );
    event ProductAddedInTheRequestList(
        uint date,
        address _from,
        string _Name,
        uint _Amount
    );
    struct structSeller{
         string name;
         uint PriceDemanded;
         bool isOnSale;
    }
    struct structBuyer{
        string productName;
        uint ExpectedPrice;
    }
    structSeller[] Seller;
    structBuyer[] Buyer;
    mapping (address => structSeller[]) internal sellmap;
    mapping (address => structBuyer[]) internal buymap;
    //mapping(uint => bool) checking;
    function sellers( string memory ProductForSale, uint PriceYouDemand) public payable returns(string memory, uint256, uint256) {
        SellerAddress = payable(msg.sender);
        productId = uint (keccak256(abi.encodePacked(ProductForSale, PriceYouDemand)));
        SellingIds.push(productId);
        sellmap[msg.sender] = Seller;
        string memory statement = "Product added for sale";
        Seller.push(structSeller(ProductForSale, PriceYouDemand, true));
        emit ProductAddedForSale(block.timestamp, msg.sender, ProductForSale, PriceYouDemand);
        TotalProducts++;
        return (statement, productId, TotalProducts);
    }
     function BuyHere(string memory ProductYouWantToBuy, uint priceYouExpect)public payable returns(bool) {
        addressId = payable(msg.sender);
        productCheck = uint (keccak256(abi.encodePacked(ProductYouWantToBuy, priceYouExpect)));
        Buyer.push(structBuyer(ProductYouWantToBuy, priceYouExpect));
        emit ProductAddedInTheRequestList(block.timestamp, msg.sender, ProductYouWantToBuy, priceYouExpect);
        RequestsLists++;
        for(int I =0; I<int(Seller.length); I++){
        if (productId == productCheck && Seller[uint(I)].isOnSale == true){
            i = I;
            return true;
            Deal();
            }
        }
        return false;
    }
    function transfer() public payable{
        if(i != -1){
            to.transfer(Seller[uint(i)].PriceDemanded);
            to.transfer(msg.value);
            delete Seller[uint(i)];
        }
    }
    function Deal() public payable{
        if(from.balance >= Seller[uint(i)].PriceDemanded){
        transfer();
        }
        else{
             "You Don't have enough Ether";
        }
    }
