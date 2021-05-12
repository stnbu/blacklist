// Compiles now. Barely tested.

pragma solidity ^0.8.0;

contract Blacklist {

    // Private because we are implementing an interface here and this isn't part of it.
    mapping(address => bool) private blacklist;

    // ~~We have no owner, nor anything to construct.~~ We might WANT an owner an aall'at.

    // External, for now. Do we want these to be "public"?
    function isBlacklisted(address _address) external view returns (bool) {
        return blacklist[_address];
    }

    function blacklistAddress(address _address) external returns (bool) {
        // I believe there are better ways to check for this. Does it "cost more" to return an error message?
        require(msg.sender == _address);
        blacklist[msg.sender] = true;
        return blacklist[msg.sender];
    }
}
