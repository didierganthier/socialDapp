pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract Social is ERC721 {
    uint256 id;
    constructor() ERC721('SocialDapp', 'SDP') {
      id = 0;
    }
}