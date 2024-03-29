// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.19;

// import contract from openzeppelin contracts

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

import { Base64 } from "./libraries/Base64.sol";

// inherit the contract from ERC721
contract MyEpicNFT is ERC721 {

  // inherit Counters from contract to keep track of every NFT

   using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

  // This SVG code to change the word that's displayed. 
  string svgPartOne = "<svg xmlns='http://www.w3.org/2000/svg' preserveAspectRatio='xMinYMin meet' viewBox='0 0 350 350'><style>.base { fill: white; font-family: serif; font-size: 24px; }</style><rect width='100%' height='100%' fill='";
  string svgPartTwo = "'/><text x='50%' y='50%' class='base' dominant-baseline='middle' text-anchor='middle'>";

  // create arrays random words.

  string[] names = ["Bryan", "Mike", "Brown", "Bright", "Wisdom", "Grace", "Glory", "Ani", "Anita", "Joy", "Destiny", "Favour", "Emeka", "levan", "Mali"];
  string[] location = ["London", "Nigeria", "China", "America", "Gana", "Paris", "Mixico", "Gamany", "UK" "Canada", "Dubai", "Kongo", "Tokoy", "Las_Vegas", "Cemeron"];
  string[] words = ["man", "woman", "boy", "girl", "beautiful", "handsome", "move", "cook", "home", "Car", "house", "fan", "music", "computer", "book"];

  string[] colors = ["red", "#08C2A8", "black", "yellow", "blue", "green"];

  event NewEpicNFTMinted(address sender, uint256 tokenId);

  // Input name and symbol of nft token
        constructor() ERC721("GUMAN_NFT", 'GUM') {
        console.log("This is my NFT contract. Whoa!");
    }

  // I create a function to randomly pick a word from each array.

  function pickRandomFirstWord(uint256 tokenId) public view returns (string memory) {

    uint256 rand = random(string(abi.encodePacked("names", Strings.toString(tokenId))));
    rand = rand % names.length;
    return names[rand];
  }

  function pickRandomSecondWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("lacation", Strings.toString(tokenId))));
    rand = rand % location.length;
    return location[rand];
  }


  function pickRandomThirdWord(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("words", Strings.toString(tokenId))));
    rand = rand % words.length;
    return words[rand];
  }  

  function pickRandomColor(uint256 tokenId) public view returns (string memory) {
    uint256 rand = random(string(abi.encodePacked("colors", Strings.toString(tokenId))));
    rand = rand % colors.length;
    return colors[rand];
  }

  
  function random(string memory input) internal pure returns (uint256) {
      return uint256(keccak256(abi.encodePacked(input)));
  }

  function makeAnEpicNFT() public {
        // create new token ids for each nft token
         uint256 newItemId = _tokenIds.current();

        // randomly grab one word from each arrays.
    string memory first = pickRandomFirstWord(newItemId);
    string memory second = pickRandomSecondWord(newItemId);
    string memory third = pickRandomThirdWord(newItemId);
    string memory combinedWord = string(abi.encodePacked(first, second, third));



    //concatenate it all together
    string memory randomColor = pickRandomColor(newItemId);
    string memory finalSvg = string(abi.encodePacked(svgPartOne, randomColor, svgPartTwo, combinedWord, "</text></svg>"));

    // Get all the JSON metadata in place and base64 encode it.
    string memory json = Base64.encode(
        bytes(
            string(
                abi.encodePacked(
                    '{"name": "',
                    // set the title of our NFT as the generated word.
                    combinedWord,
                    '", "description": "A highly acclaimed collection of squares.", "image": "data:image/svg+xml;base64,',
                    // add data:image/svg+xml;base64 and then append our base64 encode our svg.
                    Base64.encode(bytes(finalSvg)),
                    '"}'
                )
            )
        )
    );

    // Just like before, we prepend data:application/json;base64, to our data.
    string memory finalTokenUri = string(
        abi.encodePacked("data:application/json;base64,", json)
    );

    console.log("\n--------------------");
    console.log(finalSvg);
    console.log("--------------------\n");
        
        // Call the safe mint function from ERC721 contract
          _safeMint(msg.sender, newItemId);
        
        // save the metadata of each nft 
          _setTokenURI(newItemId, finalTokenUri);

        // increment the ids of the nft
          _tokenIds.increment();

    emit NewEpicNFTMinted(msg.sender, newItemId);
  }

     // Set the NFT's metadata
  function _setTokenURI(uint256 _tokenId, string memory _tokenUri) public view returns (string memory) {
    require(_exists(_tokenId));
    console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
    return (_tokenUri);
  }
}