# **solidity**   

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

# **TestContract** :

**Environment preparation**  
Node.js and npm installation:
```sh
node -v
npm -v
```
Truffle installation:
Truffle is a world-class development environment, testing framework and asset pipeline for blockchains using the Ethereum Virtual Machine (EVM).

```sh
npm install -g truffle
```

Ganache installation:
Ganache is a local blockchain network for development purposes. It is convenient to use and it has a friendly interface.
```sh
npm install -g cli-truffle
```
or
```sh
npm install -g truffle
```

```solidity
contract TestContract is
    Initializable,
    ERC1155Upgradeable,
    OwnableUpgradeable,
    PausableUpgradeable,
    ERC1155BurnableUpgradeable,
    ERC1155SupplyUpgradeable,
    UUPSUpgradeable
```
TestContract use all those contract and inherit from them some of there functions in the purpose of securing and writing a good optimized smart contract.

```solidity
function initialize() public initializer {
        __ERC1155_init("");
        __Ownable_init();
        __Pausable_init();
        __ERC1155Burnable_init();
        __ERC1155Supply_init();
        __UUPSUpgradeable_init();
    }
```

this function is an initializer because in the upgradeable smart contract we use init function instead of constructor.  
the constructor is executed when the smart contrqct instance is deployed.but in the proxy-based upgradeability system, it would never happen.that why we use _initializer_. to do so we import contract rom OpenZeppelin Upgrades:
```solidity
import "../node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
```

```solidity
__ERC1155_init("")
```
this function aim to set the URI of the ERC1155 init.
```solidity
__Ownable_init()
```
this line aim to initialize the owner of the contract
```solidity
__Pausable_init()
```
this function allows children to implement an emergency stop mechanism that can be triggered by an authorized account.
```
__ERC1155Burnable_init();
```
this function allow to users to burn there token 
```
__ERC1155Supply_init()
```
to initialise our contract to keep track of totalSupply for ERC1155 tokens
```
__UUPSUpgradeable_init()
```
first what is UUPS proxy pattern:
we need to note that in this case, the word “upgradable” doesn't mean mutable.
The UUPS proxy pattern is similar to the transparent proxy pattern --A proxy with a built in admin and upgrade interface--, except the upgrade is triggered via the logic contract rather than from the proxy contract.
so this function initialise our contract to be upgradable.

```solidity
mapping(string => uint256) eventBadgeIdStore;
    uint256 private badgeIdCounter;
    string[] public eventStore;
```























