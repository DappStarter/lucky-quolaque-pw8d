import Kibble from Project.Kibble
import FungibleToken from Flow.FungibleToken

// This script returns an account's Kibble balance.

pub fun main(address: Address): UFix64 {
    let account = getAccount(address)
    
    let vaultRef = account.getCapability(Kibble.BalancePublicPath)
                    .borrow<&Kibble.Vault{FungibleToken.Balance}>()
                    ?? panic("Could not borrow Balance reference to the Vault")

    return vaultRef.balance
}
