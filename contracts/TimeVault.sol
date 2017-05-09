/// @title Time-locked vault of tokens allocated to STORJ owners after variable amount of days
/// based on Lunyr Token

contract TimeVault is SafeMath, BurnableToken {
    address owner;
    BurnableToken storjToken;
    uint256 unlockedAtTime;
    uint256 public timeLocked;

    /// @notice Constructor function sets the Storj Multisig address and
    /// total number of locked tokens to transfer
    function TimeVault(address _owner, uint256 _timeLocked, address _token) {
        if (_owner == 0x0) throw;
        storjToken = BurnableToken(_token);
        timeLocked = _timeLocked;
        owner = _owner;
        // variable time locked in seconds since epoch
        unlockedAtTime = safeAdd(block.timestamp, timeLocked);
    }

    /// @notice Transfer locked tokens to Storj's multisig wallet
    function unlock() external {
        // Wait your turn!
        if (block.timestamp < unlockedAtTime) throw;
        // Will fail if allocation (and therefore toTransfer) is 0.
        if(!storjToken.transfer(owner, storjToken.balanceOf(this))) throw;
    }
    
    /// Allow holders to burn tokens before unlock time
    function burn(uint amount) {
        if (msg.sender != owner) throw;
        storjToken.burn(amount);
    }

    // disallow ether payment
    function () { throw; }
}