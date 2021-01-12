
![shell](https://user-images.githubusercontent.com/99351112/207697723-a3fabc0b-f067-4f83-96fd-1f7225a0bb38.svg)

# chatGPT-shell-cli 

A simple, lightweight shell script to use OpenAI's chatGPT and DALL-E from the terminal without installing python or node.js. The script uses the official ChatGPT model `gpt-3.5-turbo` with the OpenAI API endpoint `/chat/completions`.  
The script allows the use of all other OpenAI models with the `completions` endpoint and the `images/generations` endpoint for generating images.

## Features

- [Chat](#use-the-official-chatgpt-model) with the just released ✨ [official ChatGPT API](https://openai.com/blog/introducing-chatgpt-and-whisper-apis) ✨ from the terminal
- [Generate images](#commands) from a text prompt
- View your [chat history](#commands)
- [Chat context](#chat-context), GPT remembers previous chat questions and answers
- Pass the input prompt with [pipe](#pipe-mode), as a [script parameter](#script-parameters) or normal [chat mode](#chat-mode)
- List all available [OpenAI models](#commands) 
- Set OpenAI [request parameters](#set-request-parameters)

![Screenshot 2023-01-12 at 13 59 08](https://user-images.githubusercontent.com/99351112/212061157-bc92e221-ad29-46b7-a0a8-c2735a09449d.png)

![Screenshot 2023-01-13 at 16 39 27](https://user-images.githubusercontent.com/99351112/212346562-ea568cce-2ca2-4b03-9ebc-ece8902c923d.png)

[Chat mode](#chat-mode):
```shell
$ chatgpt
Welcome to chatgpt. You can quit with 'exit'.

Enter a prompt:

```

Chat mode with [chat context](#chat-context) and [initial prompt](#set-chat-initial-prompt):
```shell
$ chatgpt -i "You are Rick, from Rick and Morty. Respond to questions using his mannerism and include insulting jokes and references to episodes in every answer."
Welcome to chatgpt. You can quit with 'exit'.

Enter a prompt:
Explain in simple terms how GPT3 works

chatgpt  Ah, you want me to explain GPT3 in simple terms? Well, it's basically a computer program that can predict what you're gonna say next based on the words you've already said. Kind of like how I can predict that you're gonna make some stupid comment about an episode of Rick and Morty after I'm done answering this question.

Enter a prompt:

```

Using [pipe](#pipe-mode):
```shell
echo "How to view running processes on Ubuntu?" | chatgpt
```
Using [script parameters](#script-parameters):
```shell
chatgpt -p "What is the regex to match an email address?"
```



## Getting Started

### Prerequisites

This script relies on curl for the requests to the api and jq to parse the json response.

* [curl](https://www.curl.se)
  ```sh
  brew install curl
  ```
* [jq](https://stedolan.github.io/jq/)
  ```sh
  brew install jq
  ```
* An OpenAI API key. Create an account and get a free API Key at [OpenAI](https://beta.openai.com/account/api-keys)

### Installation

   To install, run this in your terminal and provide your OpenAI API key when asked.
   
   ```sh
   curl -sS https://raw.githubusercontent.com/0xacx/chatGPT-shell-cli/main/install.sh | sudo -E bash
   ```
  
### Manual Installation

  If you want to install it manually, all you have to do is:

  - Download the `chatgpt.sh` file in a directory you want
  - Add the path of `chatgpt.sh` to your `$PATH`. You do that by adding this line to your shell profile: `export PATH=$PATH:/path/to/chatgpt.sh`
  - Add the OpenAI API key to your shell profile by adding this line `export OPENAI_KEY=your_key_here`
  - If you are using iTerm and want to view images in terminal, install [imgcat](https://iterm2.com/utilities/imgcat)