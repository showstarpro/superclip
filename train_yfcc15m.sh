CONFIG=$1
DIR=$2
NV_GPUS=$(nvidia-smi --query-gpu=name --format=csv,noheader | wc -l)
GPUS=${GPUS:-${NV_GPUS}}
NNODES=${NNODES:-1}
NODE_RANK=${NODE_RANK:-0}
PORT=${PORT:-55565}
PORT=9007
DIR=${DIR:-"superclip"}
MASTER_ADDR=${MASTER_ADDR:-"127.0.0.1"}
HOSTE_NODE_ADDR=${MASTER_ADDR}:${PORT}
TIMESTAMP=$(date +%Y_%m_%d-%H_%M_%S)
export TOKENIZERS_PARALLELISM=true

export WANDB_MODE=offline
export WANDB_DIR=/lpai/output/models/wandb_log


DATA_PATH="/lpai/dataset/yfcc15m/0-1-6/yfcc15m_webdataset/0{0000..1410}.tar"
VAL_DATA_PATH="/lpai/dataset/imagenet-1k/0-1-0/ILSVRC2012/val"

echo "$DIR"
cd $DIR

torchrun --nproc_per_node=$GPUS \
        --rdzv_endpoint=$HOSTE_NODE_ADDR \
       	--nnodes=$NNODES --node_rank=$NODE_RANK \
        -m training.main \
        --config="${CONFIG}" \
        --train-data $DATA_PATH \
        --imagenet-val $VAL_DATA_PATH