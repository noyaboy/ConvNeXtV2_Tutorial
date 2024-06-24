# ConvNeXtV2_Tutorial
# Installation

We provide installation instructions for ImageNet classification experiments here.

## Dependency Setup
Create an new conda virtual environment
```
conda create -n convnextv2 python=3.8 -y
```
```
conda activate convnextv2
```

Install [Pytorch](https://pytorch.org/)>=1.8.0, [torchvision](https://pytorch.org/vision/stable/index.html)>=0.9.0 following official instructions. For example:
```
pip install torch==1.8.0+cu111 torchvision==0.9.0+cu111 -f https://download.pytorch.org/whl/torch_stable.html
```

Clone this repo and install required packages:
```
git clone https://github.com/facebookresearch/ConvNeXt-V2.git
```
```
pip install timm==0.3.2 tensorboardX six
```
```
pip install submitit
```
```
conda install openblas-devel -c anaconda -y
```
According to the instructions on this webpage: https://blog.csdn.net/qq_38825788/article/details/125859041, authorize the GitHub account.

Then, Install MinkowskiEngine:

*(Note: we have implemented a customized CUDA kernel for depth-wise convolutions, which the original MinkowskiEngine does not support.)*
```
cd ConvNeXt-v2
```
```
git submodule update --init --recursive
```
```
git submodule update --recursive --remote
```
```
cd MinkowskiEngine
```
```
python setup.py install --blas_include_dirs=${CONDA_PREFIX}/include --blas=openblas
```

Install apex
```
git clone https://github.com/NVIDIA/apex
```
```
cd apex
```
```
pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
```
```
cd ..
```
