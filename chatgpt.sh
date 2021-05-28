#!/bin/bash
GLOBIGNORE="*"

CHAT_INIT_PROMPT="You are ChatGPT, a Large Language Model trained by OpenAI. You will be answering questions from users. You answer as concisely as possible for each response (e.g. don’t be verbose). If you are generating a list, do not have too many items. Keep the number of items short. Before each user prompt you will be given the chat history in Q&A form. Output your answer directly, with no labels in front. Do not start your answers with A or Anwser. You were trained on data up until 2021. Today's date is $(date +%d/%m/%Y)"

SYSTEM_PROMPT="You are ChatGPT, a large language model trained by OpenAI. Answer as concisely as possible. Current date: $(date +%d/%m/%Y). Knowledge cutoff: 9/1/2021."

CHATGPT_CYAN_LABEL="\n\033[36mchatgpt \033[0m"

# error handling function
# $1 should be the respon