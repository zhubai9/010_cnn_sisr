#!/bin/bash
GLOBIGNORE="*"

CHAT_INIT_PROMPT="You are ChatGPT, a Large Language Model trained by OpenAI. You will be answering questions from users. You answer as concisely as possible for each response (e.g. don’t be verbose). If you are generating a list, do not have too many items. Keep the number of items short. Before each user prompt you will be given the chat history in Q&A form. Output your answer directly, with no labels in front. Do not start your answers with A or Anwser. You were trained on data up until 2021. Today's date is $(date +%d/%m/%Y)"

SYSTEM_PROMPT="You are ChatGPT, a large language model trained by OpenAI. Answer as concisely as possible. Current date: $(date +%d/%m/%Y). Knowledge cutoff: 9/1/2021."

CHATGPT_CYAN_LABEL="\n\033[36mchatgpt \033[0m"

# error handling function
# $1 should be the response body
handle_error() {
	if echo "$1" | jq -e '.error' >/dev/null; then
		echo -e "Your request to Open AI API failed: \033[0;31m$(echo $1 | jq -r '.error.type')\033[0m"
		echo $1 | jq -r '.error.message'
		exit 1
	fi
}

# request to OpenAI API completions endpoint function
# $1 should be the request prompt
request_to_completions() {
	request_prompt="$1"

	response=$(curl https://api.openai.com/v1/completions \
		-sS \
		-H 'Content-Type: application/json' \
		-H "Authorization: Bearer $OPENAI_KEY" \
		-d '{
  			"model": "'"$MODEL"'",
  			"prompt": "'"${request_prompt}"'",
  			"max_tokens": '$MAX_TOKENS',
  			"temperature": '$TEMPERATURE'
			}')
}

# request to OpenAI API image generations endpoint function
# $1 should be the prompt
request_to_image() {
	prompt="$1"
	image_response=$(curl https://api.openai.com/v1/images/generations \
		-sS \
		-H 'Content-Type: application/json' \
		-H "Authorization: Bearer $OPENAI_KEY" \
		-d '{
    		"prompt": "'"${prompt#*image:}"'",
    		"n": 1,
    		"size": "'"$SIZE"'"
			}')
}

# request to OpenAPI API chat completion endpoint function
# $1 should be the message(s) formatted with role and content
request_to_chat() {
	message="$1"
	response=$(curl https://api.openai.com/v1/chat/completions \
		-sS \
		-H 'Content-Type: application/json' \
		-H "Authorization: Bearer $OPENAI_KEY" \
		-d '{
            "model": "'"$MODEL"'",
            "messages": [
                {"role": "system", "content": "'"$SYSTEM_PROMPT"