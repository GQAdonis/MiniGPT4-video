#!/bin/bash
#SBATCH --partition=batch


#SBATCH --job-name=mistral_all%j
#SBATCH --output=mistral_all%j.out
#SBATCH --error=mistral_all%j.err
#SBATCH --time=0-10:00:00
#SBATCH --mem=64G
#SBATCH --nodes=1
## run the application:

PRED="./../../results/mistral_cmd_webwid_videoInstruction_no_subtitles_msvd_no_subtitles.json"
OUTPUT_DIR="./../output/msvd/mistral_all"
rm -rf $OUTPUT_DIR
API_KEY="api_key"
NUM_TASKS=128


python evaluate_activitynet_qa.py \
    --pred_path ${PRED} \
    --output_dir "${OUTPUT_DIR}/fewshot_accuracy" \
    --output_json "${OUTPUT_DIR}/fewshot_accuracy_results.json"\
    --api_key $API_KEY \
    --num_tasks $NUM_TASKS

echo pred_path: $PRED