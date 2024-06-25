# ConvNeXtV2_Tutorial
Refered to https://github.com/facebookresearch/ConvNeXt-V2
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
pip install torch==2.1.0+cu118 torchvision==0.16.0+cu118 -f https://download.pytorch.org/whl/torch_stable.html
```
```
ssh -T git@github.com
```
If meet Permission denied(publickey), according to the instructions on this webpage: https://blog.csdn.net/qq_38825788/article/details/125859041, authorize the GitHub account.
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
Then, Install MinkowskiEngine:

*(Note: we have implemented a customized CUDA kernel for depth-wise convolutions, which the original MinkowskiEngine does not support.)*
```
cd ConvNeXt-V2
```
```
git submodule update --init --recursive
```
Then, Fix the Possible Error "Fatal: Needed a Single Revision"  by https://phoenixnap.com/kb/git-pull-submodule
Clone this repo and install required packages:
```
git submodule update --recursive --remote
```
```
cd MinkowskiEngine
```
```
conda install -c conda-forge -c defaults -c nvidia cuda==11.8
```
```
python setup.py install --blas_include_dirs=${CONDA_PREFIX}/include --blas=openblas
```

Install apex
```
cd ..
```
```
git clone https://github.com/NVIDIA/apex
```
```
cd apex
```
```
pip install -v --no-build-isolation --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
```
Install Makefile
```
cd ..
```
```
git clone https://github.com/noyaboy/ConvNeXtV2_Tutorial/blob/main/Makefile
```
