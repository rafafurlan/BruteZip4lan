# BruteZip4Lan

BruteZip4Lan is a simple multi-threaded ZIP password-cracking tool built using Bash and \`7z\`. It allows you to brute force ZIP archives using a wordlist, testing multiple passwords in parallel to find the correct one.

## Features

- Multi-threaded ZIP password brute-forcing
- Simple usage with easy-to-understand parameters
- Uses `7z` for password testing without extraction
- Shows real-time status updates
- Customizable thread count for faster processing

## Requirements

- **7zip** (`p7zip-full`)
  - Install on Debian-based systems:
    ```bash
    sudo apt-get install p7zip-full
    ```

## Installation

Clone the repository and navigate to the project folder:

```bash
git clone https://github.com/rafafurlan/BruteZip4Lan.git
cd BruteZip4Lan
```

Make the script executable:

```bash
chmod +x brutezip4lan.sh
```

## Usage

The script requires the following parameters:

```bash
./brutezip4lan.sh ZIP_ARCHIVE WORDLIST.TXT NUM_THREADS
```

- `ZIP_ARCHIVE`: The path to the ZIP file you want to crack.
- `WORDLIST.TXT`: A wordlist file containing potential passwords.
- `NUM_THREADS`: The number of threads to use for parallel processing.

### Example

To brute force a ZIP file named `secret.zip` using `passwords.txt` as the wordlist and 20 threads:

```bash
./brutezip4lan.sh secret.zip passwords.txt 20
```

### Output

- The script will display a message indicating that the password-cracking process has started: 
  ```
  Attempting to find the password... Please wait.
  ```

- If the correct password is found, the script will output:
  ```
  Password found: your_password
  ```

- If the process completes without finding the password, it will display:
  ```
  Password cracking process completed.
  ```

## Contributing

Feel free to fork this repository, submit pull requests, or open issues if you encounter bugs or have suggestions for improvements.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

