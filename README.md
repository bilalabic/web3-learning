# 💸 PayShare dApp

I made this project while completing Level 1 of **Stellar Journey to Mastery: Monthly Builder Challenges**. I am learning Stellar development. This is a basic dApp — you connect your wallet, split a bill between friends, and send XLM to each person.

---

## Setup

```bash
npm install
npm start
```

You need [Freighter wallet](https://www.freighter.app/) browser extension. Set it to **Testnet** and fund your wallet from inside the extension.

---

## How to use

1. Click **Connect Wallet**
2. Enter total amount and number of people
3. Enter each address
4. Click **Send to All**

---

## Screenshots

**Wallet connected and balance shown**
![wallet connected](ss/wallet-connected.png)

**QR code for receiving XLM**
![qr code](ss/qr-code.png)

**Freighter asks you to confirm the transaction**
![freighter confirm](ss/freighter-confirm.png)

**After sending — each address shows success or fail**
![split bill result](ss/split-bill-result.png)

**Recent transactions list**
![transaction history](ss/transaction-history.png)

---

## Stack

React · Stellar SDK · Freighter API · Tailwind CSS · DaisyUI
