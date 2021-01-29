// SPDX-License-Identifier: UNLICENCED
pragma solidity >=0.6.0 <0.8.0;
pragma abicoder v2;

import "./XIVDatabaseLib.sol";

interface Token{
    function transferOwnership(address newOwner) external;
    function stop() external;
    function start() external;
    function close() external;
    function decimals() external view returns(uint256);
    function symbol() external view returns(string memory);
    function totalSupply() external view returns (uint256);
    function balanceOf(address who) external view returns (uint256);
    function transfer(address to, uint256 value) external returns (bool);
    function allowance(address owner, address spender) external view returns (uint256);
    function transferFrom(address from, address to, uint256 value) external returns (bool);
    function approve(address spender, uint256 value) external returns (bool);
    function mint( address to, uint256 value ) external returns (bool);
    function increaseApproval(address _spender, uint _addedValue) external returns (bool);
    function decreaseApproval(address _spender, uint _subtractedValue) external returns (bool);
    function burn(uint256 _value) external;
    function burnTokens(address who,uint256 _value) external;
}


interface OracleWrapper{
    function getPrice(string calldata currencySymbol,uint256 oracleType) external view returns (uint256);
}
interface DatabaseContract{
    function transferETH(address payable userAddress,uint256 amount) external;
    function transferTokens(address contractAddress,address userAddress,uint256 amount) external;
    function transferFromTokens(address contractAddress,address fromAddress, address toAddress,uint256 amount) external;
    function getTokensStaked(address userAddress) external view returns(uint256);
    function updateTokensStaked(address userAddress, uint256 amount) external;
    function getTokenStakedAmount() external view returns(uint256);
    function updateTokenStakedAmount(uint256 _tokenStakedAmount) external;
    function saveStakedAddress(bool fromStake) external;
    function getBetId() external view returns(uint256);
    function updateBetId(uint256 _userBetId) external;
    function getDefiCoinsForFixedMapping(address _betContractAddress) external view returns(XIVDatabaseLib.DefiCoin memory);
    function updateDefiCoinsForFixedMapping(address _betContractAddress,XIVDatabaseLib.DefiCoin memory _defiCoinObj) external;
    function getDefiCoinBetPercentage() external view returns(uint16);
    function updateBetArray(XIVDatabaseLib.BetInfo memory bObject) external;
    function getBetArray() external view returns(XIVDatabaseLib.BetInfo[] memory);
    function getFindBetInArrayUsingBetIdMapping(uint256 _betid) external view returns(uint256);
    function updateFindBetInArrayUsingBetIdMapping(uint256 _betid, uint256 value) external;
    function updateUserStakedAddress(address _address) external;
    function getUserStakedAddress() external view returns(address[] memory);
    function getDefiCoinsForFlexibleMapping(address _betContractAddress) external view returns(XIVDatabaseLib.DefiCoin memory);
    function updateDefiCoinsForFlexibleMapping(address _betContractAddress,XIVDatabaseLib.DefiCoin memory _defiCoinObj) external;
    function getFlexibleDefiCoinArray() external view returns(XIVDatabaseLib.FlexibleInfo[] memory);
}
