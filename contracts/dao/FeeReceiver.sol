// SPDX-License-Identifier: MIT

pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";
import "../dependencies/PrismaOwnable.sol";

contract FeeReceiver is PrismaOwnable {
    using SafeERC20 for IERC20;

    constructor(address _prismaCore) PrismaOwnable(_prismaCore) {}

    function transferToken(IERC20 token, address receiver, uint256 amount) external onlyOwner {
        token.safeTransfer(receiver, amount);
    }

    function setTokenApproval(IERC20 token, address spender, uint256 amount) external onlyOwner {
        token.forceApprove(spender, amount);
    }
}
