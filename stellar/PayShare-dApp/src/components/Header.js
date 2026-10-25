import React, {useState} from 'react'
import { QRCodeSVG } from 'qrcode.react';
import { checkConnection, retrievePublicKey, getBalance, sendPayment, getTransactions} from './Freighter'

const Header = () => {
     const [connected, setConnected] = useState(false);
     const [publicKey, setPublicKey] = useState("");
     const [balance, setBalance] = useState("0");
     const [totalAmount, setTotalAmount] = useState("");
     const [peopleCount, setPeopleCount] = useState(2);
     const [recipients, setRecipients] = useState(["", ""]);
     const [splitResults, setSplitResults] = useState([]);
     const [status, setStatus] = useState("");
     const [showQR, setShowQR] = useState(false);
     const [transactions, setTransactions] = useState([]);
     const [showHistory, setShowHistory] = useState(false);

     const splitAmount = totalAmount && peopleCount > 0
          ? (parseFloat(totalAmount) / peopleCount).toFixed(7)
          : "0";

     const connectWallet = async () => {
          try {
               const allowed = await checkConnection();
               if (!allowed) return alert("Please allow access to Freighter in your browser extension.");
               const key = await retrievePublicKey();
               const bal = await getBalance(key);
               setPublicKey(key);
               setBalance(bal);
               setConnected(true);
          } catch (error) {
               console.error("Error connecting to Freighter:", error);
               alert("Failed to connect to Freighter. Please try again.");
          }
     };

     const disconnectWallet = () => {
          setConnected(false);
          setPublicKey("");
          setBalance("0");
          setStatus("");
          setSplitResults([]);
          setTransactions([]);
          setShowHistory(false);
          setShowQR(false);
     };

     const handlePeopleCountChange = (count) => {
          const n = parseInt(count);
          setPeopleCount(n);
          setRecipients(Array(n).fill("").map((_, i) => recipients[i] || ""));
     };

     const handleRecipientChange = (index, value) => {
          const updated = [...recipients];
          updated[index] = value;
          setRecipients(updated);
     };

     const handleSplitPayment = async () => {
          if (!totalAmount || parseFloat(totalAmount) <= 0) return setStatus("❌ Enter a valid total amount.");
          const validRecipients = recipients.filter(r => r.trim() !== "");
          if (validRecipients.length === 0) return setStatus("❌ Enter at least one recipient address.");

          setStatus("Sending...");
          setSplitResults([]);
          const results = [];

          for (let i = 0; i < validRecipients.length; i++) {
               try {
                    const hash = await sendPayment(validRecipients[i], splitAmount, publicKey);
                    results.push({ address: validRecipients[i], hash, success: true });
                    setStatus(`Sending... (${i + 1}/${validRecipients.length})`);
               } catch (err) {
                    results.push({ address: validRecipients[i], hash: null, success: false });
               }
          }

          const newBalance = await getBalance(publicKey);
          setBalance(newBalance);
          setSplitResults(results);
          const failed = results.filter(r => !r.success).length;
          setStatus(failed === 0 ? "✅ All payments sent!" : `⚠️ ${failed} payment(s) failed.`);
     };

     const handleGetTransactions = async () => {
          try {
               const txs = await getTransactions(publicKey);
               setTransactions(txs);
               setShowHistory(true);
          } catch (error) {
               console.error("Transaction history error:", error);
               alert("Failed to load transactions.");
          }
     };

  return (
    <div data-theme="dracula" className="min-h-screen bg-base-100 flex flex-col items-center py-6 px-6">

        <div className="navbar bg-base-200 rounded-2xl shadow-lg w-full max-w-6xl mb-6 px-6">
            <div className="flex-1">
                <span className="text-xl font-bold text-primary">💸 PayShare</span>
            </div>
            <div className="flex gap-2">
                {connected && (
                    <button onClick={disconnectWallet} className="btn btn-error btn-sm">
                        Disconnect
                    </button>
                )}
                <button onClick={connectWallet} disabled={connected} className={`btn btn-sm ${connected ? "btn-success" : "btn-primary"}`}>
                    {connected ? "✅ Connected" : "Connect Wallet"}
                </button>
            </div>
        </div>

        {connected && <div className="w-full max-w-6xl grid grid-cols-1 gap-4">

            <div className="card bg-base-200 shadow-xl">
                <div className="card-body py-4">
                    <h2 className="card-title text-base-content/60">Wallet</h2>
                    <p className="text-sm text-base-content/50 mb-1">Address</p>
                    <p className="font-mono text-xs bg-base-300 p-3 rounded-lg break-all">{publicKey}</p>
                    <div className="stat bg-primary/10 rounded-xl mt-2 text-center py-3">
                        <div className="stat-title">Balance</div>
                        <div className="stat-value text-primary">{balance} <span className="text-lg">XLM</span></div>
                    </div>
                </div>
            </div>

            <div className="grid grid-cols-2 gap-4">
                <div className="card bg-base-200 shadow-xl">
                    <div className="card-body py-4">
                        <h2 className="card-title text-base-content/60">🍕 Split Bill</h2>
                        <div className="flex flex-col gap-3">
                            <div className="flex gap-3">
                                <div className="flex-1">
                                    <label className="text-xs text-base-content/50 mb-1 block">Total Amount (XLM)</label>
                                    <input
                                        type="number"
                                        placeholder="e.g. 100"
                                        value={totalAmount}
                                        onChange={(e) => setTotalAmount(e.target.value)}
                                        className="input input-bordered w-full"
                                    />
                                </div>
                                <div className="w-28">
                                    <label className="text-xs text-base-content/50 mb-1 block">People</label>
                                    <input
                                        type="number"
                                        min="1"
                                        max="20"
                                        value={peopleCount}
                                        onChange={(e) => handlePeopleCountChange(e.target.value)}
                                        className="input input-bordered w-full"
                                    />
                                </div>
                            </div>

                            {totalAmount > 0 && (
                                <div className="bg-primary/10 rounded-xl p-3 text-center">
                                    <p className="text-xs text-base-content/50">Each person pays</p>
                                    <p className="text-2xl font-bold text-primary">{splitAmount} <span className="text-sm">XLM</span></p>
                                </div>
                            )}

                            <div className="flex flex-col gap-2">
                                <label className="text-xs text-base-content/50">Recipient Addresses</label>
                                {recipients.map((addr, i) => (
                                    <input
                                        key={i}
                                        type="text"
                                        placeholder={`Person ${i + 1} address`}
                                        value={addr}
                                        onChange={(e) => handleRecipientChange(i, e.target.value)}
                                        className="input input-bordered input-sm w-full font-mono"
                                    />
                                ))}
                            </div>

                            <button onClick={handleSplitPayment} className="btn btn-primary w-full">
                                💸 Send to All
                            </button>

                            {status && (
                                <p className={`text-center text-sm font-medium ${status.includes("✅") ? "text-success" : status.includes("⚠️") ? "text-warning" : status.includes("❌") ? "text-error" : "text-base-content/60"}`}>
                                    {status}
                                </p>
                            )}

                            {splitResults.length > 0 && (
                                <div className="flex flex-col gap-2 mt-1">
                                    {splitResults.map((r, i) => (
                                        <div key={i} className="bg-base-300 rounded-lg p-2 text-xs">
                                            <div className="flex justify-between items-center">
                                                <span className="font-mono truncate w-40">{r.address}</span>
                                                <span className={r.success ? "text-success" : "text-error"}>
                                                    {r.success ? "✅" : "❌"}
                                                </span>
                                            </div>
                                            {r.success && (
                                                <a href={`https://stellar.expert/explorer/testnet/tx/${r.hash}`} target="_blank" rel="noopener noreferrer" className="text-primary underline">
                                                    View tx →
                                                </a>
                                            )}
                                        </div>
                                    ))}
                                </div>
                            )}
                        </div>
                    </div>
                </div>

                <div className="card bg-base-200 shadow-xl">
                    <div className="card-body py-4">
                        <h2 className="card-title text-base-content/60">📥 Receive Payment</h2>
                        <div className="flex flex-col gap-3">
                            <p className="text-sm text-base-content/50">Your Address</p>
                            <p className="font-mono text-xs bg-base-300 p-3 rounded-lg break-all">{publicKey}</p>
                            <div className="flex gap-3">
                                <button
                                    onClick={() => { navigator.clipboard.writeText(publicKey); alert("Address copied!"); }}
                                    className="btn btn-outline flex-1"
                                >
                                    📋 Copy
                                </button>
                                <button onClick={() => setShowQR(!showQR)} className="btn btn-outline flex-1">
                                    {showQR ? "🙈 Hide QR" : "📷 QR Code"}
                                </button>
                            </div>
                            {showQR && (
                                <div className="flex justify-center mt-2">
                                    <QRCodeSVG value={publicKey} size={200} marginSize={4} bgColor="#ffffff" fgColor="#000000" />
                                </div>
                            )}
                        </div>
                    </div>
                </div>
            </div>

            <div className="card bg-base-200 shadow-xl">
                <div className="card-body py-4">
                    <div className="flex justify-between items-center">
                        <h2 className="card-title text-base-content/60">📜 Transaction History</h2>
                        <button onClick={handleGetTransactions} className="btn btn-outline btn-sm">
                            🔄 Refresh
                        </button>
                    </div>
                    {showHistory && (
                        <div className="flex flex-col gap-3 mt-3">
                            {transactions.map((tx) => (
                                <div key={tx.id} className="bg-base-300 rounded-xl p-4">
                                    <div className="flex justify-between items-center mb-2">
                                        <span className={`badge ${tx.to === publicKey ? "badge-success" : "badge-error"} badge-outline`}>
                                            {tx.to === publicKey ? "⬇ Received" : "⬆ Sent"}
                                        </span>
                                        <span className="font-bold">{tx.amount} XLM</span>
                                    </div>
                                    <p className="text-xs text-base-content/50 break-all">
                                        {tx.to === publicKey ? `From: ${tx.from}` : `To: ${tx.to}`}
                                    </p>
                                </div>
                            ))}
                        </div>
                    )}
                    {showHistory && transactions.length === 0 && (
                        <p className="text-center text-base-content/40 text-sm mt-3">No transactions found.</p>
                    )}
                </div>
            </div>

        </div>}
    </div>
  );
};

export default Header
