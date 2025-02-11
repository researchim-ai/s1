### Testing ###

# Testing
lm_eval --model dummy --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --output_path dummy --log_samples --gen_kwargs "max_gen_toks=32768"

# You may have to add `VLLM_WORKER_MULTIPROC_METHOD=spawn` in front of every command if you run into vLLM issues

### Qwen2.5-32B-Instruct ###
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=Qwen/Qwen2.5-32B-Instruct,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path qwen --log_samples --gen_kwargs "max_gen_toks=32768"

### s1.1 ###
# AIME2025, 1x "Wait"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1.1-32B,dtype=float32,tensor_parallel_size=8 --tasks aime25_nofigures --batch_size auto --apply_chat_template --output_path s1.1forcingignore1wait --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=1,thinking_n_ignore_str=Wait"
# AIME2025, AIME2024, MATH500, GPQA, No "Wait"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1.1-32B,dtype=float32,tensor_parallel_size=8 --tasks aime25_nofigures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path s1.1forcingauto --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"
# AIME2025, AIME2024, MATH500, GPQA, 2x "Wait"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1.1-32B,dtype=float32,tensor_parallel_size=8 --tasks aime25_nofigures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path s1.1forcingignore2wait --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=2,thinking_n_ignore_str=Wait"

### s1 without budget forcing ###
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path nottc --log_samples --gen_kwargs max_gen_toks=32768

### s1 Budget Forcing ###
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcing1k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=500"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcing1k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=1000"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcing2k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=2000"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcing4k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=4000"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcing8k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=8000"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcing16k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=16000"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingauto --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingignore1wait --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=1,thinking_n_ignore_str=Wait"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingignore2wait --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=2,thinking_n_ignore_str=Wait"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingignore4wait --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=4,thinking_n_ignore_str=Wait"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingignore6wait --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=6,thinking_n_ignore_str=Wait"

### s1 Budget forcing extrapolation ablations ###
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingignore2 --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=2"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingignore2hmm --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=2,thinking_n_ignore_str=Hmm"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path forcingignore2alternatively --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=2,thinking_n_ignore_str=Alternatively"

### s1 Rejection sampling ###
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures --batch_size auto --apply_chat_template --output_path rejection_sample3500 --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=3500,rejection_sample=true,temperature=1"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures --batch_size auto --apply_chat_template --output_path rejection_sample4k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=4000,rejection_sample=true,temperature=1"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures --batch_size auto --apply_chat_template --output_path rejection_sample5k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=5000,rejection_sample=true,temperature=1"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures --batch_size auto --apply_chat_template --output_path rejection_sample6k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=6000,rejection_sample=true,temperature=1"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures --batch_size auto --apply_chat_template --output_path rejection_sample8k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=8000,rejection_sample=true,temperature=1"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures --batch_size auto --apply_chat_template --output_path rejection_sample16k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=16000,rejection_sample=true,temperature=1"

### Token-conditonal control ###
PROMPTTOKEN=2048 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken2k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"
PROMPTTOKEN=4096 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken4k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"
PROMPTTOKEN=8192 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken8k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"
PROMPTTOKEN=16384 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken16k --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"

### Token-conditonal control + budget forcing ###
PROMPTTOKEN=2048 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken2kforcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=2048"
PROMPTTOKEN=4096 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken4kforcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=4096"
PROMPTTOKEN=8192 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken8kforcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=8192"
PROMPTTOKEN=16384 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/token-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path prompttoken16kforcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=16384"

### Step-conditional control ###
PROMPTSTEP=16 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep16 --log_samples --gen_kwargs max_gen_toks=32768,max_tokens_thinking=auto
PROMPTSTEP=32 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep32 --log_samples --gen_kwargs max_gen_toks=32768,max_tokens_thinking=auto
PROMPTSTEP=64 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep64 --log_samples --gen_kwargs max_gen_toks=32768,max_tokens_thinking=auto
PROMPTSTEP=128 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep128 --log_samples --gen_kwargs max_gen_toks=32768,max_tokens_thinking=auto
PROMPTSTEP=256 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep256 --log_samples --gen_kwargs max_gen_toks=32768,max_tokens_thinking=auto

### Step-conditional control + budget forcing ###
PROMPTSTEP=16 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep16forcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer,until_thinking=<|im_start|>0"
PROMPTSTEP=32 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep32forcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer,until_thinking=<|im_start|>0"
PROMPTSTEP=64 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep64forcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer,until_thinking=<|im_start|>0"
PROMPTSTEP=128 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep128forcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer,until_thinking=<|im_start|>0"
PROMPTSTEP=256 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep256forcing --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer,until_thinking=<|im_start|>0"

### Step-conditional control + budget forcing Answer (not used in paper) ###
PROMPTSTEP=16 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep16forcinganwer --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer
Final Answer:,until_thinking=<|im_start|>0"
PROMPTSTEP=32 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep32forcinganwer --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer
Final Answer:,until_thinking=<|im_start|>0"
PROMPTSTEP=64 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep64forcinganwer --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer
Final Answer:,until_thinking=<|im_start|>0"
PROMPTSTEP=128 OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/step-conditional-control,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptstep128forcinganwer --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_start=<|im_start|>,thinking_end=<|im_start|>answer
Final Answer:,until_thinking=<|im_start|>0"

### Class-conditional control ###
PROMPTLONG=true OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptlong --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"
PROMPTSHORT=true OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=simplescaling/s1-32B,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures,aime24_nofigures,openai_math,gpqa_diamond_openai --batch_size auto --apply_chat_template --output_path promptshort --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto"

### Majority ###
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=Qwen/Qwen2.5-32B-Instruct,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures_agg64,aime24_nofigures_agg64,openai_math_agg64,gpqa_diamond_openai_agg64 --batch_size auto --apply_chat_template --output_path qwenagg64 --log_samples --gen_kwargs "max_gen_toks=32768,temperature=1"
OPENAI_API_KEY=YOUR_OPENAI_KEY PROCESSOR=gpt-4o-mini lm_eval --model vllm --model_args pretrained=Qwen/Qwen2.5-32B-Instruct,tokenizer=Qwen/Qwen2.5-32B-Instruct,dtype=float32,tensor_parallel_size=8 --tasks aime24_figures_agg64,aime24_nofigures_agg64,openai_math_agg64,gpqa_diamond_openai_agg64 --batch_size auto --apply_chat_template --output_path forcingignore2waitagg64 --log_samples --gen_kwargs "max_gen_toks=32768,max_tokens_thinking=auto,thinking_n_ignore=2,thinking_n_ignore_str=Wait,temperature=1"
