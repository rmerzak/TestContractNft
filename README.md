# **solidity**   
![]({{site.baseurl}}//download.png)


## introduction:
_everything in Ethereum is just a smart contract_ and the best way to write it is to use Solidity.
Solidity is a brand new programming language native to Ethereum, the second largest cryptocurrency by market capitalization.
Ethereum is not only a cryptocurrency capable of storing value or making payments, but a fully fledged platform for creating what’s known as a smart contract. and the best way to secure your smart contract is to use openzeppelin library.

### openzeppelin:
openzeppelin is a library for secure smart contract development. once is intalled you can use the contracts in the library by importing them.

instalation:
```
npm install -g @openzeppelin\contract
```
security trick: always use codes from the source not from any online web sites.
most of openzeppelin contracts are expected to be used via inheritance.

### TestContract:
this is a smart contract for learning ntf, tokens, security, access control ...
we will use openzeppelin as a library for all the secure function implemented in those secure smart contract in this library.

**used contract**  

1.ERC1155Upgradeable.sol  
2.OwnableUpgradeable.sol  
3.PausableUpgradeable.sol  
4.ERC1155BurnableUpgradeable.sol  
5.ERC1155SupplyUpgradeable.sol  
6.Initializable.sol  
7.UUPSUpgradeable.sol  

Questions:
what is token and what are the diffrent type of token in ethereum?
Access control and ownership?

# **token**  
token is a representation of something in the blockchain.this something can be money,services,...

type of tokens:  
 -fungibles  
 -non-fungibles
 
ERC20: the most widespread token standard for fungible assets, albeit somewhat limited by its simplicity.    
ERC721:  the de-facto solution for non-fungible tokens, often used for collectibles and games.  
ERC777:  a richer standard for fungible tokens, enabling new use cases and building on past learnings. Backwards compatible with ERC20.  
ERC1155: a novel standard for multi-tokens, allowing for a single contract to represent multiple fungible and non-fungible tokens, along with batched operations for increased gas efficiency.


# **Access control and ownership**  

Access control:  
is essential to prevent unauthorized access to critical functions  who is allowed to do this thing, or to mint tokrns, vote on proposals, freeze transfers and many other things. it so important to understand how to implement it or lrt some one steals your whole system.  

ownership:  
define the owner of a contract and do all the administrative tasks on it.  






















