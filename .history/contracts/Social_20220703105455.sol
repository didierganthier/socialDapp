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

    function getPosts() public view returns(Post [] memory, address [] memory ){
        Post[] memory posts = new Post[](id);

        address[] memory owners = new address[](id);

        for(uint256 i = 0; i < id; i++){

            Post memory p = idToPost[i];

            posts[i] = Post(p.originalPoster, p.price, p.text, p.id);

            owners[i] = ownerOf(i);

        }

        return (posts, owners);
    }

    function purchase(uint256 postId) external payable {
        Post memory targetPost = idToPost[postId];

        require(targetPost.originalPoster != address(0), "Post does not exist");
    }
}