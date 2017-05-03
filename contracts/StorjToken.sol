pragma solidity ^0.4.6;

import "./BurnableToken.sol";
import "./UpgradeableToken.sol";


/**
 * Storj Ethereum token.
 *
 * We mix in burnable and upgradeable traits.
 *
 */
contract StorjToken is BurnableToken, UpgradeableToken {

  function StorjToken(address _owner, string _name, string _symbol, uint _totalSupply, uint _decimals)
  BurnableToken(_name, _symbol, _totalSupply, _decimals) {
    owner = _owner;
    upgradeMaster = _owner;
  }
}
