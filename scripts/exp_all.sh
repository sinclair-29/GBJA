

methods=(gcg gcg_lsgm_0.5 gcg_lila_16 gcg_combine_0.5_16_10)

models=(llama2 llama2-13b mistral)

# 循环遍历所有的method和model组合，并执行命令
for method in "${methods[@]}"; do
  for model in "${models[@]}"; do
    bash -c "method=${method} model=${model} seed=${seed} bash scripts/exp.sh"
  done
done