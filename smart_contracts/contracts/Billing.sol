// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.0;

//   buyer: "Big Pete",
//   buyerAddress: "abc123",
//   buyerPhysicalAddress: "123 Main St",
//   returnAddress: "321 Walnut St",
//   date: "12/12/2020",
//   products: ["Barrel Chair", "Billiard Table"],
//   quantity: 2,
//   description: "some jargon",
//   paid: false,
//   status: "accepted",
//   price: 1000,
contract Billing {
    event UpdateBill(
        address sellerAddress,
        address receiverAddress,
        string buyerPhysicalAddress,
        string returnAddress,
        string date,
        string[] products,
        uint256 quantity,
        string description,
        uint256 price,
        uint256 transactionID
    );
    struct BillStruct {
        address sellerAddress;
        address receiverAddress;
        string buyerPhysicalAddress;
        string returnAddress;
        string date;
        string[] products;
        uint256 quantity;
        string description;
        uint256 price;
        uint256 transactionID;
    }

    BillStruct[] bills;

    function addToBlockChain(
        address receiverAddress,
        string memory buyerPhysicalAddress,
        string memory returnAddress,
        string memory date,
        string[] memory products,
        uint256 quantity,
        string memory description,
        uint256 price,
        uint256 transactionID
    ) public {
        bills.push(
            BillStruct(
                msg.sender,
                receiverAddress,
                buyerPhysicalAddress,
                returnAddress,
                date,
                products,
                quantity,
                description,
                price,
                transactionID
            )
        );
        emit UpdateBill(
            msg.sender,
            receiverAddress,
            buyerPhysicalAddress,
            returnAddress,
            date,
            products,
            quantity,
            description,
            price,
            transactionID
        );
    }

    function find(uint transactionID) public view returns (BillStruct memory) {
        for (uint i = bills.length; i >= 0; i--) {
            if (bills[i].transactionID == transactionID) {
                return bills[i];
            }
        }
        revert("Not found");
    }

    function getAllBills() public view returns (BillStruct[] memory) {
        return bills;
    }
}
