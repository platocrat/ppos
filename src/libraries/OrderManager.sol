// SPDX-License-Identifier: GPL-3.0-or-later
pragma solidity ^0.8.10;

import "../Sweetgreen/libraries/SgMenu__Spring2022.sol";

library OrderManager {
    function sendOrderToBS(SgMenu__Spring2022.Order storage self) public {
        // address dst; // dst is address of BatchSubmitter;
        // someTransferMethod(_order, dst)
    }

    // todo: Finish this function!!
    function sendOrderToOM(SgMenu__Spring2022.Order storage self)
        public
        pure
        returns (SgMenu__Spring2022.Order memory order)
    {
        // address admin_ = admin;
        // address dst; // dst is address of BatchSubmitter;
        // someTransferMethod(_order, dst)

        return self;
    }
}
