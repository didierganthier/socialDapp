pragma solidity >=0.4.22 <0.9.0;

import '@openzeppelin/contracts/token/ERC721/ERC721.sol';

contract Social is ERC721 {
    uint256 id;

    struct Post {

        address originalPoster;

        uint256 price;

        string text;
        uint256 id;
    }

    mapping(uint256 => Post) idToPost;

    constructor() ERC721('SocialDapp', 'SDP') {
      id = 0;
    }

    function post(string memory text, uint256 price) external {
        _mint(msg.sender, id);

        idToPost[id] = Post(msg.sender, price, text, id);

        id++;
    }
}