<><div>
            Pay Share DApp
       </div><div>
                 {publicKey && (
                      <>
                           <p>Connected Wallet: {publicKey}</p>
                           <p>Balance: {balance} XLM</p>
                      </>

                 )}
                 <button onClick={connectWallet} disabled={connected}>
                      {connected ? "Connected" : "Connect Wallet"}
                 </button>
                 <div>
    <div>
    <h3>Receive Payment</h3>
    <p>Your Address: {publicKey}</p>
    <button onClick={() => {
        navigator.clipboard.writeText(publicKey);
        alert("Address copied!");
    }}>
        Copy Address
    </button>
    <button onClick={() => setShowQR(!showQR)}>
        {showQR ? "Hide QR" : "Show QR"}
    </button>
    {showQR && (
        <div>
            <QRCodeSVG 
    value={publicKey} 
    size={300}
    marginSize={4}
    bgColor="#ffffff"
    fgColor="#000000"
/>
        </div>
    )}
</div>
          <div>
    <h3>Transaction History</h3>
    <button onClick={handleGetTransactions}>
        Load Transactions
    </button>

    {showHistory && (
        <ul>
            {transactions.map((tx) => (
                <li key={tx.id}>
                    <p>Type: {tx.type}</p>
                    <p>Amount: {tx.amount} XLM</p>
                    <p>From: {tx.from}</p>
                    <p>To: {tx.to}</p>
                </li>
            ))}
        </ul>
    )}
</div>
</div>
                 {connected && (
    <div>
        <h3>Send Payment</h3>
        <input
            type="text"
            placeholder="Destination Address"
            value={destination}
            onChange={(e) => setDestination(e.target.value)}
        />
        <input
            type="number"
            placeholder="Amount (XLM)"
            value={amount}
            onChange={(e) => setAmount(e.target.value)}
        />
        <button onClick={handleSendPayment}>
            Send
        </button>
        {status && <p>{status}</p>}
    </div>
)}
            </div></>