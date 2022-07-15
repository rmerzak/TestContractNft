// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "../node_modules/@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "../node_modules/@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "../node_modules/@openzeppelin/contracts-upgradeable/security/PausableUpgradeable.sol";
import "../node_modules/@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155BurnableUpgradeable.sol";
import "../node_modules/@openzeppelin/contracts-upgradeable/token/ERC1155/extensions/ERC1155SupplyUpgradeable.sol";
import "../node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "../node_modules/@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";

contract TestContract is Initializable, ERC1155Upgradeable, OwnableUpgradeable, PausableUpgradeable, ERC1155BurnableUpgradeable, ERC1155SupplyUpgradeable, UUPSUpgradeable
{
    function initialize() public initializer {
        __ERC1155_init("");
        __Ownable_init();
        __Pausable_init();
        __ERC1155Burnable_init();
        __ERC1155Supply_init();
        __UUPSUpgradeable_init();
    }

    mapping(string => uint256) eventBadgeIdStore;
    uint256 private badgeIdCounter;
    string[] public eventStore;

    function setURI(string memory newuri) public onlyOwner {
        _setURI(newuri);
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

    function mintEventBadgeAndTransfer(
        string calldata eventName,
        address attendee,
        string calldata eventData
    ) external onlyOwner {
        require(attendee != address(0), "ERC1155: mint to the zero address");

        require(
            eventBadgeIdStore[eventName] > 0,
            "Invalid event or event not exists to mint badges"
        );

        uint256 eventBadgeId = eventBadgeIdStore[eventName];

        bytes memory tokenData = (bytes(eventData));

        _mint(attendee, eventBadgeId, 1, tokenData);
    }

    function addNewEvents(string[] memory events) external onlyOwner {
        for (uint256 i = 0; i < events.length; i++) {
            require(
                eventBadgeIdStore[events[i]] == 0,
                "Event is already exists"
            );
            eventBadgeIdStore[events[i]] = ++badgeIdCounter;
            eventStore.push(events[i]);
        }
    }

    function getAllEvents() external view returns (string[] memory) {
        return eventStore;
    }

    function balanceOfEventBadgeToken(
        string calldata eventName,
        address account
    ) external view returns (uint256) {
        require(account != address(0), "address is invalid");
        uint256 badgeId = eventBadgeIdStore[eventName];
        return balanceOf(account, badgeId);
    }

    function _beforeTokenTransfer(
        address operator,
        address from,
        address to,
        uint256[] memory ids,
        uint256[] memory amounts,
        bytes memory data
    )
        internal
        override(ERC1155Upgradeable, ERC1155SupplyUpgradeable)
        whenNotPaused
    {
        super._beforeTokenTransfer(operator, from, to, ids, amounts, data);
    }

    function _authorizeUpgrade(address newImplementation)
        internal
        override
        onlyOwner
    {}
}