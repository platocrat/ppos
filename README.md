# Private Point-of-Sale (PPoS) Protocol

A _private_ point-of-sale protocol (PPoS).

> Note: this project is inspired by @abigger87's [cloaks](https://github.com/abigger87/cloaks) and a [Hayden Adam's tweet about McDonald's equity being tokenized](https://twitter.com/haydenzadams/status/1476959560543965189?s=20&t=322BdX-rvdnD5o4DXbEKcA)

<img width="1029" alt="Screen Shot 2022-06-21 at 1 43 29 PM" src="https://user-images.githubusercontent.com/37757724/174874697-1db9fec3-0fdb-4882-a829-0f65fb8843c7.png">

## Keeping orders private every time

Since menus generally have a limited number of items, we need to ensure that the hashed order inputs into the `order()` function are unique every time. That is, an order input value, i.e. one Chicken Pesto Parm, will return a unique hashed output for every new order of the same item. The intent of uniquely hashed order values for every individual order is to increase the level of privacy for Alice's order history.

We can achieve this by adding a salt value along with the hash of the order.

## Attack vectors

### 1. Order contents

One potential attack vector is the publicly available price that is paid for the order. Since the same order, containing the exact same items, will have the same total price, one could deduce the list of items that were in the order.

### 2. Anticipating order schedules

With the information provided by the order contents that an account address makes, with a complete history of scheduled purchases (i.e. they know _when_ the account usually makes their orders from public transaction history on-chain), a malicious actor could create and submit a volley of fake orders to drive up gas prices for their victims. The malicious actor could also buy out certain items from a vendors menu, preventing their target from being able to make their regularly order. Further protocol design and research could be done to further reduce these kinds of attacks.

## Architecture
<!-- 
At the moment, these are just ideas for what I think are the core features
-->
Critical features of the PPoS protocol include:

### 1. MEV minimization

_Out-going_ transactions from the PPoS protocol are protected against MEV, i.e. against:

* [frontrunning](https://en.wikipedia.org/wiki/Front_running)
* targeted attacks on order schedules (causes havoc for either the vendor or consumer)
* etc.

### 2. Privacy

In-going _and_ out-going transactions to the PPoS protocol are kept private from external parties to maximize order confidentiality.

### 3. Fast confirmations/receipts

In traditional finance, consumer orders are typically processed instantly, along with a receipt that is sent to the buyer.

PPoS aims to maintain the same level of speed for order confirmations and receipts so that consumer purchases/sales feel just as familiar as in the tradfi world.

<!-- 
@todo  How the fuck do I achieve this?
Need to think of a simple and good enough implementation to solve this
-->

<!-- ## Architecture/Design -->

## Appendix

### i. Only stablecoins, initially

An obvious decision, yet it must be noted that users of the PPoS protocol can only use stablecoins, at least initially, to pay for items from vendors (sellers).

Although only stablecoins will be accepted initially by default, in the future, there could be other contracts/protocols that offer the feature to create escrow contracts between parties that enable purchases/sales with alternative tokens, e.g. ETH, WETH, WBTC, etc.
