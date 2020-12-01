# CS 463 Project Plan

## Project requirements
- Project Report
    - Introduction
    - Program specs
    - How implemented
    - Screenshots
    - Conclusion


## Resources
- `https:// www.di-mgt.com.au/rsa_alg.html`



## General Notes
### Algorithm
- defined in `https:// www.di-mgt.com.au/rsa_alg.html#keygen`
    *Input*
        - Req'd modulus bit length `k`
    *Output*
        - RSA key pair `((N,e),d)` where:
            - `N` is the modulus
                - and the product of two primes `p` and `q` 
            - `e` is the public exponent
                - must be *less than* and *coprime* to `r`
                    - where `r = (p-1)(q-1)`
            - `d` is the *private* exponent
                - such that `ed ≡ 1 mod r`


## RSA Calculator Implementation
### Step 1 - Prework
1. *Set `p` and `q`*
    - `p` and `q` must both be prime nums

2. *Calc `N = p * q`*
    - Modulus N

3. *Calc `r = (p-1)(q-1)`*
    
4. *Determine valid `K = (e * d) ≡ (1 mod r)`*
    - `K` is any number that:
        - Can be *factored* (for `e` and `d`)
        - *Equal* to `1 mod r`


### Step 2 - Generate RSA key pair
1. *Choose public key `e`*
    - `e` must be:
        - *less than* and *coprime* to `r = (p-1)(q-1)`
        - One of the cofactors of `K`

2. *Choose private key `d`*
    - `d` must be:
        - such that `e * d ≡ 1 mod (p-1)(q-1)`
        - One of the cofactors of `K`

3. *Display keypair*
    - ((N,e),d)


### Step 3 - Encryption
1. *Enter message to encrypt*
    - must be a *plaintext message* represented as:
        - Positive integer `m` where `1 < m < n`

2. *Compute ciphertext*
    - `c = m^e mod n`
        - Reqs Bob's *public key* `(n, e)`



### Step 4 - Decryption
1. *Compute message from given ciphertext*
    - `m = c^d mod n`

