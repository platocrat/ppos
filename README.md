# Private Point-of-Sale System

A _private_ point-of-sale system that achieves privacy by using a commit-reveal scheme.

> Note: this project is inspired by @abigger87's [cloaks](https://github.com/abigger87/cloaks), an extensible ERC-721 with a built-in commitment scheme.

## Why this commit-reveal scheme is needed

1. Alice (buyer/sender) is hungry and wants to buy a Chicken Pesto Parm from Sweetgreen.
2. Alice wants to make/send her order on Optimism, but she is concerned about her order being publicly visible on-chain; Alice doesn't want others to know what is in the orders she's making/sending.
3. Bob (contract/PPoS) is the PPoS as a smart contract on Optimism.
4. Bob manages and processes the orders that are sent to it.
5. However, the orders Bob it receives are _kept private from external actors_ by using a _commit-reveal scheme_.

## PPoS's commit-reveal scheme

On a higher-level, PPoS's commit-reveal scheme works as follows:

1. Alice sends her finalized order as a message in a locked box and sends it to Bob.
2. Bob can't access the message because it's locked in the box, and Alice can't change the message because it's in Bob's possession.
3. Once Alice confirms that her order is final, she reveals her message of her order to Bob, unlocking the box and showing the message to Bob (contract).

### Keeping orders private every time

Since menus generally have a limited number of items, we need to ensure that the hashed order inputs into the `order()` function are unique every time. That is, an order input value, i.e. 1 Chicken Pesto Parm, will return a unique hashed output for every new order. The intent of uniquely hashed order values for every order is to increase the level of privacy for Alice's order history.

## Attack vectors

### 1. Order contents

One potential attack vector is the publicly available price that is paid for the order. Since the same order, containing the exact same items, will have the same total price, one could deduce the list of items that were in the order.

### 2. Anticipating order schedules

With the information provided by the order contents that an account address makes, with a complete history of scheduled purchases (i.e. they know _when_ the account usually makes their orders from public transaction history on-chain), a malicious actor could create and submit a volley of fake orders to drive up gas prices for their victims. The malicious actor could also buy out certain items from a vendors menu, preventing their target from being able to make their regularly order. Further protocol design and research could be done to further reduce these kinds of attacks.
