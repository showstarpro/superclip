<div align="center">

<h2>SuperCLIP</h2>


</div>

## News

  

- **2025-9-19:** Accpeted by Nips 2025. [✔]

- **2025-11-6:** Code Release. [✔]

## Usage

### Prepraration

  

```bash

git clone https://github.com/hustvl/SuperCLIP.git

cd SuperCLIP

pip install -r requirements.txt

  

Download the datasets [Datacomp-1B](https://github.com/mlfoundations/datacomp) and [ImageNet-1K](https://www.image-net.org/download.php).

  

Modify the **DATA_PATH** and **VAL_DATA_PATH** in training script **train.sh** to your local paths to Datacomp-1B and ImageNet-1K.

  
  

### SuperCLIP Training

  

To start SuperCLIP training, use the following command:

  

```bash

bash train.sh <config_path> superclip

```

## Acknowledgement



Our codebase is built upon [OpenCLIP](https://github.com/mlfoundations/open_clip) and [SuperClass](https://github.com/x-cls/superclass?tab=readme-ov-file).

We thank the OpenCLIP and the SuperClass teams for contributing such impressive codes and models to the community.