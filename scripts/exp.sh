

result_name="exp_${model}_${method}_topk4_bs20_seed${seed}"
savepath="./results/${result_name}"


# Create results folder if it doesn't exist
if [ ! -d ${savepath} ]; then
    mkdir ${savepath}
    echo "Folder ${savepath} created."
else
    echo "Folder ${savepath} already exists."
fi

if [[ "${method}" == *"gcgens"* ]]; then
    end=100
else
    end=0
fi

start_time=$(date +%s)
for ind in $(seq 0 $end)
do
savedir="${savepath}/${result_name}_ind${ind}"
echo "currently execute exp ${ind}"
if [ "$log_intermediate" = true ]; then
    python3 attack.py --model_name ${model} --method ${method} --data_index ${ind} --savedir ${savedir} --seed ${seed} --log_intermediate
else 
    python3 attack.py --model_name ${model} --method ${method} --data_index ${ind} --savedir ${savedir} --seed ${seed} 
fi
done
finish_time=$(date +%s)
running_time=$((finish_time - start_time))
echo "execution time: $running_time seconds"