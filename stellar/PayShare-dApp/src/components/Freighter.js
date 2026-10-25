import { signTransaction, setAllowed, getAddress } from "@stellar/freighter-api";
import * as StellarSdk from '@stellar/stellar-sdk';


const server = new StellarSdk.Horizon.Server('https://horizon-testnet.stellar.org');

const checkConnection = async () => {
     return await setAllowed();
};
const retrievePublicKey = async () => {
     const {address}= await getAddress();
     return address;
};
const getBalance = async (publicKey) => {
     const account = await server.loadAccount(publicKey);
     const xlm = account.balances.find((b) => b.asset_type === "native");
     return xlm?.balance || "0";
};

const userSignTransaction = async (xdr, signWith) => {
     const result = await signTransaction(xdr, {
          networkPassphrase: StellarSdk.Networks.TESTNET,
          accountToSign: signWith
     });
     return result.signedTxXdr;
};

     const getTransactions = async (publicKey) => {
    const payments = await server.payments()
        .forAccount(publicKey)
        .limit(10)
        .order("desc")
        .call();
    return payments.records;
};

const sendPayment = async (destination, amount, publicKey) => {
    const sourceAccount = await server.loadAccount(publicKey);
    const transaction = new StellarSdk.TransactionBuilder(sourceAccount, {
    fee: StellarSdk.BASE_FEE,
    networkPassphrase: StellarSdk.Networks.TESTNET
})
.addOperation(StellarSdk.Operation.payment({
    destination: destination,
    asset: StellarSdk.Asset.native(),
    amount: amount
}))
.setTimeout(30)
.build();
     const xdr = transaction.toXDR();
     const signedXDR = await userSignTransaction(xdr, publicKey);
     const signedTransaction = StellarSdk.TransactionBuilder.fromXDR(
    signedXDR,
    StellarSdk.Networks.TESTNET
);
     const result = await server.submitTransaction(signedTransaction);
     return result.hash;

};
export {checkConnection, retrievePublicKey, getBalance, userSignTransaction, sendPayment, getTransactions};