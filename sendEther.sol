// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Marketplace {

    struct Order {
        address payable seller;
        uint256 price;
        bool delivered;
    }

    mapping(uint256 => Order) public orders;

    // Seller lists a product
    function createOrder(uint256 orderId, uint256 price) external {
        orders[orderId] = Order(payable(msg.sender), price, false);
    }

    // Buyer pays for the order
    function buyProduct(uint256 orderId) external payable {
        Order storage order = orders[orderId];

        require(msg.value == order.price, "Incorrect payment");
        require(!order.delivered, "Already completed");

        // Mark as delivered before external call
        order.delivered = true;

        // Send Ether to the seller
        (bool success, ) = order.seller.call{value: msg.value}("");

        require(success, "Payment to seller failed");
    }
}