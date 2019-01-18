pragma solidity 0.4.25;

contract VendorPt4 {
  struct Item {
    string name;
    uint count;
  }
  
  address storeOwner;
  mapping(string => Item) inventory;

  event Purchase(address sender, string itemName);

  constructor() public {
    storeOwner = msg.sender;
  }

  modifier inStock(string itemName) {
    require(inventory[itemName].count > 0);
    _;
  }

  function purchaseItem(string itemName) external inStock(itemName) {
    inventory[itemName].count--;
    emit Purchase(msg.sender, itemName);
  }

  function addItem(string itemName, uint itemCount) external {
    require(msg.sender == storeOwner);
    inventory[itemName] = Item(itemName, itemCount);
  }

  function getItemCount(string itemName) view external returns (uint count) {
    return inventory[itemName].count;
  }
}
