pragma solidity ^0.6.6;

contract adasvetel {
    
    address vevo;
    mapping(address => uint256) public letetosszeg;
    
    modifier csakvevo() {
        require(msg.sender == vevo);
        _;
    }
    
    constructor() public {
        vevo = msg.sender;
    }
    
    function letetbehelyez(address elado) public csakvevo payable {
         uint256 osszeg = msg.value;
         letetosszeg[elado] = letetosszeg[elado] + osszeg;
    }
    
    function kifizet(address payable ugyfel) public csakvevo {
        uint256 kifizetes = letetosszeg[ugyfel];
        letetosszeg[ugyfel] = 0;
        ugyfel.transfer(kifizetes);
    }
    
}