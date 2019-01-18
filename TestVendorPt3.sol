pragma solidity 0.4.25;

import "./VendorPt4.sol";

contract TestVendorPt4 {

  VendorPt4 vendor = new VendorPt4();
  
  function test_AddItem() external {
    assert(vendor.getItemCount("Hats") == 0);
    vendor.addItem("Hats", 15);
    assert(vendor.getItemCount("Hats") == 15);
    vendor.addItem("Mugs", 5);
    vendor.addItem("Ties", 30);
    vendor.addItem("Scarves", 20);
    assert(vendor.getItemCount("Scarves") == 20);
  }

  function test_PurchaseItem() external {
    vendor.addItem("Watches", 5);
    vendor.addItem("Sunglasses", 40);
    vendor.addItem("Water Bottles", 18);
    assert(vendor.getItemCount("Sunglasses") == 40);
    vendor.purchaseItem("Sunglasses");
    assert(vendor.getItemCount("Sunglasses") == 39);
  }
}
