pragma solidity ^0.4.8;

import 'zeppelin/contracts/token/StandardToken.sol';
import 'zeppelin/contracts/SafeMath.sol'; // TODO: Convert to SafeMathLib


contract BurnableToken is StandardToken {

  /** How many tokens we burned */
  event Burned(address burner, uint difference);

  /**
   * Burn extra tokens from a balance.
   *
   */
  function burn(uint tokensLeftToOwner) {
    address burner = msg.sender;
    uint difference = safeSub(balances[burner], tokensLeftToOwner);
    balances[burner] = tokensLeftToOwner;
    totalSupply = safeSub(totalSupply, difference);
    Burned(burner, difference);

    // Keep exchanges happy
    Transfer(burner, 0x0000000000, difference);
  }
}
